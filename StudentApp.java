import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

public class StudentApp extends JFrame {

    // ====== CHANGE THESE TO MATCH YOUR MYSQL SETUP ======
    static final String URL = "jdbc:mysql://localhost:3306/student_db";
    static final String USER = "root";
    static final String PASSWORD = "Chandrikamreddy@2008";
    // ====================================================

    JTextField txtId = new JTextField();
    JTextField txtName = new JTextField();
    JTextField txtEmail = new JTextField();
    JComboBox<String> cmbCourse = new JComboBox<>();
    JComboBox<Integer> cmbSemester = new JComboBox<>(new Integer[]{1, 2, 3, 4, 5, 6, 7, 8});

    DefaultTableModel model = new DefaultTableModel(
            new String[]{"Student ID", "Name", "Email", "Course", "Semester"}, 0) {
        public boolean isCellEditable(int row, int col) {
            return false;
        }
    };
    JTable table = new JTable(model);

    Connection con;

    public StudentApp() {
        setTitle("Student Record Management");
        setSize(800, 500);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        connectToDatabase();
        buildScreen();
        loadCourses();
        loadStudents();
    }

    // ---------- Connect to MySQL ----------
    void connectToDatabase() {
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this,
                    "Could not connect to MySQL:\n" + e.getMessage(),
                    "Connection Error", JOptionPane.ERROR_MESSAGE);
            System.exit(1);
        }
    }

    // ---------- Build the GUI ----------
    void buildScreen() {
        JPanel form = new JPanel(new GridLayout(5, 2, 5, 5));
        form.setBorder(BorderFactory.createTitledBorder("Student Details"));
        form.add(new JLabel("Student ID:"));
        form.add(txtId);
        form.add(new JLabel("Name:"));
        form.add(txtName);
        form.add(new JLabel("Email:"));
        form.add(txtEmail);
        form.add(new JLabel("Course:"));
        form.add(cmbCourse);
        form.add(new JLabel("Semester:"));
        form.add(cmbSemester);

        JButton btnAdd = new JButton("Add Student");
        JButton btnUpdate = new JButton("Update Student");
        JButton btnDelete = new JButton("Delete Student");
        JButton btnClear = new JButton("Clear");
        JButton btnView = new JButton("View Students");

        JPanel buttons = new JPanel();
        buttons.add(btnAdd);
        buttons.add(btnView);
        buttons.add(btnUpdate);
        buttons.add(btnDelete);
        buttons.add(btnClear);

        JPanel top = new JPanel(new BorderLayout());
        top.add(form, BorderLayout.CENTER);
        top.add(buttons, BorderLayout.SOUTH);

        add(top, BorderLayout.NORTH);
        add(new JScrollPane(table), BorderLayout.CENTER);

        btnAdd.addActionListener(e -> addStudent());
        btnView.addActionListener(e -> loadStudents());
        btnUpdate.addActionListener(e -> updateStudent());
        btnDelete.addActionListener(e -> deleteStudent());
        btnClear.addActionListener(e -> clearForm());

        // When a row is clicked, copy it into the form
        table.getSelectionModel().addListSelectionListener(e -> {
            if (!e.getValueIsAdjusting()) {
                fillFormFromSelectedRow();
            }
        });
    }

    // ---------- SELECT: course dropdown ----------
    void loadCourses() {
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT course_name FROM courses ORDER BY course_name");
            while (rs.next()) {
                cmbCourse.addItem(rs.getString("course_name"));
            }
        } catch (SQLException e) {
            showError(e);
        }
    }

    // ---------- SELECT: show all students ----------
    void loadStudents() {
        model.setRowCount(0);
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM students ORDER BY student_id");
            while (rs.next()) {
                model.addRow(new Object[]{
                        rs.getInt("student_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("course"),
                        rs.getInt("semester")
                });
            }
        } catch (SQLException e) {
            showError(e);
        }
    }

    // ---------- INSERT ----------
    void addStudent() {
        if (!inputIsValid()) return;
        String sql = "INSERT INTO students (student_id, name, email, course, semester) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(txtId.getText().trim()));
            ps.setString(2, txtName.getText().trim());
            ps.setString(3, txtEmail.getText().trim());
            ps.setString(4, (String) cmbCourse.getSelectedItem());
            ps.setInt(5, (Integer) cmbSemester.getSelectedItem());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(this, "Student added successfully.");
            clearForm();
            loadStudents();
        } catch (SQLIntegrityConstraintViolationException e) {
            JOptionPane.showMessageDialog(this,
                    "A student with this ID already exists.", "Duplicate ID", JOptionPane.WARNING_MESSAGE);
        } catch (SQLException e) {
            showError(e);
        }
    }

    // ---------- UPDATE ----------
    void updateStudent() {
        if (!inputIsValid()) return;
        String sql = "UPDATE students SET name=?, email=?, course=?, semester=? WHERE student_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, txtName.getText().trim());
            ps.setString(2, txtEmail.getText().trim());
            ps.setString(3, (String) cmbCourse.getSelectedItem());
            ps.setInt(4, (Integer) cmbSemester.getSelectedItem());
            ps.setInt(5, Integer.parseInt(txtId.getText().trim()));
            int rows = ps.executeUpdate();
            if (rows == 0) {
                JOptionPane.showMessageDialog(this, "No student found with this ID.");
                return;
            }
            JOptionPane.showMessageDialog(this, "Student updated successfully.");
            clearForm();
            loadStudents();
        } catch (SQLException e) {
            showError(e);
        }
    }

    // ---------- DELETE ----------
    void deleteStudent() {
        String idText = txtId.getText().trim();
        if (idText.isEmpty() || !isNumber(idText)) {
            JOptionPane.showMessageDialog(this, "Select a student from the table (or enter a valid ID) first.");
            return;
        }
        int choice = JOptionPane.showConfirmDialog(this,
                "Delete student " + idText + "?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (choice != JOptionPane.YES_OPTION) return;

        try {
            PreparedStatement ps = con.prepareStatement("DELETE FROM students WHERE student_id=?");
            ps.setInt(1, Integer.parseInt(idText));
            int rows = ps.executeUpdate();
            if (rows == 0) {
                JOptionPane.showMessageDialog(this, "No student found with this ID.");
                return;
            }
            JOptionPane.showMessageDialog(this, "Student deleted.");
            clearForm();
            loadStudents();
        } catch (SQLException e) {
            showError(e);
        }
    }

    // ---------- Helpers ----------
    boolean isNumber(String s) {
        try {
            Integer.parseInt(s);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    boolean inputIsValid() {
        String id = txtId.getText().trim();
        String name = txtName.getText().trim();
        String email = txtEmail.getText().trim();

        if (id.isEmpty() || !isNumber(id) || Integer.parseInt(id) <= 0) {
            warn("Student ID must be a positive whole number.");
            return false;
        }
        if (name.isEmpty()) {
            warn("Name cannot be empty.");
            return false;
        }
        if (name.length() > 50) {
            warn("Name must be 50 characters or less.");
            return false;
        }
        if (!email.contains("@") || !email.contains(".") || email.length() > 100) {
            warn("Please enter a valid email address.");
            return false;
        }
        if (cmbCourse.getSelectedItem() == null) {
            warn("Please select a course.");
            return false;
        }
        return true;
    }

    void warn(String message) {
        JOptionPane.showMessageDialog(this, message, "Invalid Input", JOptionPane.WARNING_MESSAGE);
    }

    void fillFormFromSelectedRow() {
        int row = table.getSelectedRow();
        if (row == -1) return;
        txtId.setText(model.getValueAt(row, 0).toString());
        txtName.setText(model.getValueAt(row, 1).toString());
        txtEmail.setText(model.getValueAt(row, 2).toString());
        cmbCourse.setSelectedItem(model.getValueAt(row, 3).toString());
        cmbSemester.setSelectedItem(model.getValueAt(row, 4));
    }

    void clearForm() {
        txtId.setText("");
        txtName.setText("");
        txtEmail.setText("");
        if (cmbCourse.getItemCount() > 0) cmbCourse.setSelectedIndex(0);
        cmbSemester.setSelectedIndex(0);
        table.clearSelection();
    }

    void showError(SQLException e) {
        JOptionPane.showMessageDialog(this, "Database error:\n" + e.getMessage(),
                "Error", JOptionPane.ERROR_MESSAGE);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new StudentApp().setVisible(true));
    }
}