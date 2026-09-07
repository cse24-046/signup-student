package bac.ac.signupstudent;

public class UserStore {
    private static final int MAX_USERS = 1000;
    private static String[] names = new String[MAX_USERS];
    private static String[] surnames = new String[MAX_USERS];
    private static String[] studentIds = new String[MAX_USERS];
    private static String[] emails = new String[MAX_USERS];
    private static String[] passwords = new String[MAX_USERS];
    private static String[] genders = new String[MAX_USERS];
    private static int count = 0;

    public synchronized static int getCount() {
        return count;
    }

    public synchronized static boolean studentIdExists(String id) {
        if (id == null) return false;
        for (int i = 0; i < count; i++) {
            if (studentIds[i] != null && studentIds[i].equalsIgnoreCase(id)) return true;
        }
        return false;
    }

    public synchronized static boolean emailExists(String email) {
        if (email == null) return false;
        for (int i = 0; i < count; i++) {
            if (emails[i] != null && emails[i].equalsIgnoreCase(email)) return true;
        }
        return false;
    }

    public synchronized static int addUser(String name, String surname, String studentId, String email, String password, String gender) {
        if (count >= MAX_USERS) return -1;
        names[count] = name;
        surnames[count] = surname;
        studentIds[count] = studentId;
        emails[count] = email;
        passwords[count] = password;
        genders[count] = gender;
        count++;
        return count - 1;
    }

    public synchronized static int authenticate(String email, String password) {
        if (email == null || password == null) return -1;
        for (int i = 0; i < count; i++) {
            if (emails[i] != null && emails[i].equalsIgnoreCase(email) && passwords[i] != null && passwords[i].equals(password)) {
                return i;
            }
        }
        return -1;
    }

    public synchronized static String getName(int idx) {
        if (idx < 0 || idx >= count) return null;
        return names[idx];
    }

    public synchronized static String getSurname(int idx) {
        if (idx < 0 || idx >= count) return null;
        return surnames[idx];
    }

    public synchronized static String getStudentId(int idx) {
        if (idx < 0 || idx >= count) return null;
        return studentIds[idx];
    }

    public synchronized static String getEmail(int idx) {
        if (idx < 0 || idx >= count) return null;
        return emails[idx];
    }

    public synchronized static String getPassword(int idx) {
        if (idx < 0 || idx >= count) return null;
        return passwords[idx];
    }

    public synchronized static String getGender(int idx) {
        if (idx < 0 || idx >= count) return null;
        return genders[idx];
    }
}
