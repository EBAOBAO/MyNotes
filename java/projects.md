# 项目

## 作业

```java
package com.EBAOBAO.abstract_;

public class AbstractExercise01 {
    public static void main(String[] args) {
        Manager ebaobao = new Manager("EBAOBAO", 514, 1213.34, 13422.29);
        ebaobao.work();

        CommonEmployee humou = new CommonEmployee("humou", 114, 0);
        humou.work();
    }
}

abstract class Employee {
    private String name;
    private int id;
    private double salary;

    public Employee(String name, int id, double salary) {
        this.name = name;
        this.id = id;
        this.salary = salary;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public double getSalary() {
        return salary;
    }

    public abstract void work();
}

class Manager extends Employee {
    private double bonus;

    public Manager(String name, int id, double salary, double bonus) {
        super(name, id, salary);
        this.bonus = bonus;
    }

    @Override
    public void work() {
        System.out.println("Manager " + this.getName() + " is working...");
    }
}

class CommonEmployee extends Employee{
    public CommonEmployee(String name, int id, double salary) {
        super(name, id, salary);
    }

    @Override
    public void work() {
        System.out.println("Common employee " + this.getName() + " is working...");
    }
}
```

```java
package com.EBAOBAO.homeworks;

public class homework01 {
    public static int heap_size;

    public static void main(String[] args) {
        Person[] persons = new Person[4];
        persons[1] = new Person("humou", 10, "shit");
        persons[2] = new Person("jay", 50, "student");
        persons[3] = new Person("bubu", 30, "juju");

        heapSort(persons);

        for (int i = 1; i < persons.length; i++) {
            System.out.println(persons[i]);
        }
    }

    /*
    定义一个Person类{name, age, job}, 初始化Person对象数据
    并按照age从大到小进行排序
    */

    public static int parent(int i) {
        return (int) (i / 2);
    }

    public static int left(int i) {
        return 2 * i;
    }

    public static int right(int i) {
        return 2 * i + 1;
    }

    public static void minHeapify(Person[] p, int i) {
        int j = i;
        int largest, l, r = 0;
        Person t = null;

        while (j <= (int) (heap_size / 2)) {
            largest = j;
            l = left(j);
            r = right(j);
            if (l <= heap_size && p[l].getAge() < p[largest].getAge()) {
                largest = l;
            }
            if (r <= heap_size && p[r].getAge() < p[largest].getAge()) {
                largest = r;
            }
            if (largest == j) {
                break;
            }
            t = p[largest];
            p[largest] = p[j];
            p[j] = t;

            j = largest;
        }
    }

    public static void buildMaxHeap(Person[] p) {
        heap_size = p.length - 1;
        for (int i = (int)((p.length-1) / 2); i >= 1; i--) {
            minHeapify(p, i);
        }
    }

    public static void heapSort(Person[] p) {
        buildMaxHeap(p);
        Person t = null;
        for (int i = p.length - 1; i >= 2; i--) {
            t = p[i];
            p[i] = p[1];
            p[1] = t;
            heap_size -= 1;
            minHeapify(p, 1);
        }
    }
}

class Person {
    private String name;
    private int age;
    private String job;

    public Person(String name, int age, String job) {
        this.name = name;
        this.age = age;
        this.job = job;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", job='" + job + '\'' +
                '}';
    }
}



```

### 注册信息

需求：

1. 用户名长度2-4
2. 密码6位，只有数字
3. 邮箱有`@`与`.`字符，且`@`在`.`前面

```java
package com.EBAOBAO1.testing;  
  
import java.util.Scanner;  
  
public class Test {  
    public static void main(String[] args) {  
        Scanner input = new Scanner(System.in);  
        String userName = input.next();  
        String password = input.next();  
        String email = input.next();  
        if (userName.length() < 2 || userName.length() > 4) {  
            throw new RegistrationException("用户名长度不符");  
        } else if (!passwordOk(password)) {  
            throw new RegistrationException("密码");  
        } else if (!emailOk(email)) {  
            throw new RegistrationException("邮箱");  
        }  
        System.out.println("注册成功！");  
    }  
  
    public static boolean passwordOk(String password) {  
        if (password.length() != 6) {  
            return false;  
        }  
        char[] chs = password.toCharArray();  
        for (char c: chs) {  
            if (!Character.isDigit(c)) {  
                return false;  
            }  
        }  
        return true;  
    }  
  
    public static boolean emailOk(String email) {  
        int atIndex = email.indexOf('@');  
        int dotIndex = email.indexOf('.');  
        return (atIndex != -1 && dotIndex != -1 && atIndex < dotIndex);  
    }  
}  
  
class RegistrationException extends RuntimeException {  
    public RegistrationException(String message) {  
        super(message);  
    }  
}
```

### 名字格式化输出

```java
package com.EBAOBAO1.testing;  
  
public class Test {  
    public static void main(String[] args) {  
        String name = "EE Bao Bao";  
        printName(name);  
    }  
  
    public static void printName(String name) {  
        if (name == null) {  
            System.out.println("名字不能为空");  
            return;        }  
        String[] arr = name.split(" ");  
        if (arr.length != 3) {  
            System.out.println("名字格式错误");  
            return;        }  
        String res = String.format("%s, %s .%c", arr[2], arr[0], arr[1].toUpperCase().charAt(0));  
        System.out.println(res);  
    }  
}
```

### List应用 + 优化冒泡

```java
package com.EBAOBAO1.testing;  
  
import java.util.ArrayList;  
import java.util.List;  
  
public class Test {  
    public static class Book {  
        public String name;  
        public int price;  
  
        public Book(String name, int price) {  
            this.name = name;  
            this.price = price;  
        }  
  
        @Override  
        public String toString() {  
            return "Book{" +  
                    "name='" + name + '\'' +  
                    ", price=" + price +  
                    '}';  
        }  
    }  
  
    public static void main(String[] args) {  
        List li = new ArrayList();  
        li.add(new Book("huhu", 2342));  
        li.add(new Book("ouou", 27));  
        li.add(new Book("haohaohan", 3));  
        li.add(new Book("daxuanfeng", 435));  
        li.add(new Book("wocaobing", 5));  
  
        sort(li);  
        System.out.println(li);  
    }  
  
    public static void sort(List list) {  
        int i = list.size() - 1;  
        while (i > 0) {  
            int k = i;  
            i = 0;  
            Object temp;  
            for (int j = 0; j < k; j++) {  
                Book book1 = (Book)list.get(j);  
                Book book2 = (Book)list.get(j + 1);  
                if (book1.price > book2.price) {  
                    i = j;  
                    list.set(j, book2);  
                    list.set(j + 1, book1);  
                }  
            }  
        }  
    }  
}
```

### Map应用

```java
package com.EBAOBAO1.Map_;  
  
import java.util.HashMap;  
import java.util.Iterator;  
import java.util.Map;  
  
public class MapExercise {  
    public static void main(String[] args) {  
        Map employees = new HashMap();  
        Employee e = new Employee("EBAOBAO", 1, Integer.MAX_VALUE);  
        employees.put(e.getId(), e);  
        e = new Employee("humou", 2, 0);  
        employees.put(e.getId(), e);  
        e = new Employee("jibai", 3, Integer.MIN_VALUE);  
        employees.put(e.getId(), e);  
  
        System.out.println(employees);  
  
        for (Object key : employees.keySet()) {  
            Employee temp = (Employee) employees.get(key);  
            if (temp.getSalary() > 18000) System.out.println(temp);  
        }  
  
        Iterator iter = employees.keySet().iterator();  
        while (iter.hasNext()) {  
            Object key = iter.next();  
            Employee temp = (Employee) employees.get(key);  
            if (temp.getSalary() > 18000) System.out.println(temp);  
        }  
    }  
}  
  
class Employee {  
    private String name;  
    private int id;  
    private int salary;  
  
    public Employee(String name, int id, int salary) {  
        this.name = name;  
        this.id = id;  
        this.salary = salary;  
    }  
  
    public String getName() {  
        return name;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    }  
  
    public int getId() {  
        return id;  
    }  
  
    public void setId(int id) {  
        this.id = id;  
    }  
  
    public int getSalary() {  
        return salary;  
    }  
  
    public void setSalary(int salary) {  
        this.salary = salary;  
    }  
  
    @Override  
    public String toString() {  
        return "Employee{" +  
                "name='" + name + '\'' +  
                ", id=" + id +  
                ", salary=" + salary +  
                '}';  
    }  
}
```

### Collections 应用以及定制排序

```java
package com.EBAOBAO1.testing;  
  
import java.util.*;  
  
public class Test {  
    public static void main(String[] args) {  
        List li = new LinkedList();  
  
        li.add(new Person("BAOBAO", 18, 23124234));  
        li.add(new Person("asfa", 90, -2342));  
        li.add(new Person("yutyerte", 12, 0));  
        li.add(new Person("dsferg", 34, 23));  
        li.add(new Person("grjhfrfga", 28, 67));  
        li.add(new Person("wsfrgsfgs", 56, 67));  
        li.add(new Person("rgerg", 93, 67));  
  
        // 定制排序为降序排序  
        Collections.sort(li, new Comparator<Object>() {  
            @Override  
            public int compare(Object o1, Object o2) {  
                if (o1 == null || !(o1 instanceof Comparable) || o1.getClass() != o2.getClass()) return 0;  
                return -((Comparable) o1).compareTo(o2);  
            }  
        });  
  
        System.out.println(li);  
    }  
}  
  
class Person implements Comparable {  
    public String name;  
    public int age;  
    public int score;  
  
    public Person(String name, int age, int score) {  
        this.name = name;  
        this.age = age;  
        this.score = score;  
    }  
  
    /**  
     * 首先比较 score ，score 大者更大，  
     * 其次比较 age ，age 小者更大。  
     */  
    @Override  
    public int compareTo(Object o) {  
        if (this == o) return 0;  
        if (o == null || getClass() != o.getClass()) return 1;  
        Person p = (Person) o;  
        if (this.score != p.score) {  
            return this.score - p.score;  
        } else {  
            return p.age - this.age;  
        }  
    }  
  
    @Override  
    public String toString() {  
        return "{" +  
                "name='" + name + '\'' +  
                ", age=" + age +  
                ", score=" + score +  
                '}';  
    }  
}
```

### lab1

```java
package com.EBAOBAO.test;  
  
import java.io.*;  
import java.util.ArrayList;  
import java.util.Scanner;  
  
public class LearnCode {  
    public static void main(String[] args) throws IOException {  
        String filePath = "E:\\workspace\\IO\\in.txt";  
        ArrayList<String> sentences = new ArrayList<>();  
        Scanner input = new Scanner(System.in);  
        System.out.print("enter a word: ");  
        String key = input.next();  
        try (final FileReader fileReader = new FileReader(filePath)) {  
            char c;  
            StringBuilder sentence = new StringBuilder();  
            while ((c = (char)fileReader.read()) != 65535) {  
                if (c == '.' || c == '?' || c == '!' || c == '\r' || c == '\n') {  
                    if (c == '.' || c == '?' || c == '!') {  
                        sentence.append(c);  
                    }  
                    sentences.add(sentence.toString().trim());  
                    sentence.delete(0, sentence.length());  
                    continue;                }  
                sentence.append(c);  
            }  
//            for (String s : sentences) {  
//                System.out.println(s);  
//            }  
            System.out.println();  
            for (String s : sentences) {  
                for (String word : s.split(" ")) {  
                    char end = word.charAt(word.length() - 1);  
                    if (end == '.' || end == '?' || end == '!' || end == ',') {  
                        word = new StringBuffer(word).deleteCharAt(word.length() - 1).toString();  
                    }  
                    if (word.equals(key)) {  
                        System.out.println(s);  
                        break;                    }  
                }  
            }  
        }  
    }  
}
```

## 房屋出租系统

### 需求分析

1. 主菜单，
2. 新增房源：（姓名，电话，地址，月租，状态（已出租/未出租））
3. 查找房源：按照id
4. 修改房源：（不希望修改某个信息回车即可）
5. 房屋列表
6. 退出系统

### 设计

当软件比较复杂时，需要有模式管理。这里有很多的功能，为了方便管理与使程序结构清晰，使用 **分层模式**

框架图：明确
1. 系统有哪些类
2. 类与类的调用关系

---

HouseView.java（界面）
1. 显示界面
2. 接收用户的输入
3. 调用其他类完成各种操作

HouseService.java（业务层）
1. 完成对房屋信息的各种操作（crud）

House.java（实体类domain/模型层model）
一个House对象即是一个房屋信息

HouseRentApp.java
程序入口

Utility.java
完成获取用户各种输入

---

### 程序

Utility.java
```java
package com.houserent.utils;


/**
	工具类的作用:
	处理各种情况的用户输入，并且能够按照程序员的需求，得到用户的控制台输入。
*/

import java.util.*;
/**

	
*/
public class Utility {
	//静态属性。。。
    private static Scanner scanner = new Scanner(System.in);

    
    /**
     * 功能：读取键盘输入的一个菜单选项，值：1——5的范围
     * @return 1——5
     */
	public static char readMenuSelection() {
        char c;
        for (; ; ) {
            String str = readKeyBoard(1, false);//包含一个字符的字符串
            c = str.charAt(0);//将字符串转换成字符char类型
            if (c != '1' && c != '2' && 
                c != '3' && c != '4' && c != '5') {
                System.out.print("选择错误，请重新输入：");
            } else break;
        }
        return c;
    }

	/**
	 * 功能：读取键盘输入的一个字符
	 * @return 一个字符
	 */
    public static char readChar() {
        String str = readKeyBoard(1, false);//就是一个字符
        return str.charAt(0);
    }
    /**
     * 功能：读取键盘输入的一个字符，如果直接按回车，则返回指定的默认值；否则返回输入的那个字符
     * @param defaultValue 指定的默认值
     * @return 默认值或输入的字符
     */
    
    public static char readChar(char defaultValue) {
        String str = readKeyBoard(1, true);//要么是空字符串，要么是一个字符
        return (str.length() == 0) ? defaultValue : str.charAt(0);
    }
	
    /**
     * 功能：读取键盘输入的整型，长度小于2位
     * @return 整数
     */
    public static int readInt() {
        int n;
        for (; ; ) {
            String str = readKeyBoard(10, false);//一个整数，长度<=10位
            try {
                n = Integer.parseInt(str);//将字符串转换成整数
                break;
            } catch (NumberFormatException e) {
                System.out.print("数字输入错误，请重新输入：");
            }
        }
        return n;
    }
    /**
     * 功能：读取键盘输入的 整数或默认值，如果直接回车，则返回默认值，否则返回输入的整数
     * @param defaultValue 指定的默认值
     * @return 整数或默认值
     */
    public static int readInt(int defaultValue) {
        int n;
        for (; ; ) {
            String str = readKeyBoard(10, true);
            if (str.equals("")) {
                return defaultValue;
            }
			
			//异常处理...
            try {
                n = Integer.parseInt(str);
                break;
            } catch (NumberFormatException e) {
                System.out.print("数字输入错误，请重新输入：");
            }
        }
        return n;
    }

    /**
     * 功能：读取键盘输入的指定长度的字符串
     * @param limit 限制的长度
     * @return 指定长度的字符串
     */

    public static String readString(int limit) {
        return readKeyBoard(limit, false);
    }

    /**
     * 功能：读取键盘输入的指定长度的字符串或默认值，如果直接回车，返回默认值，否则返回字符串
     * @param limit 限制的长度
     * @param defaultValue 指定的默认值
     * @return 指定长度的字符串
     */
	
    public static String readString(int limit, String defaultValue) {
        String str = readKeyBoard(limit, true);
        return str.equals("")? defaultValue : str;
    }


	/**
	 * 功能：读取键盘输入的确认选项，Y或N
	 * 将小的功能，封装到一个方法中.
	 * @return Y或N
	 */
    public static char readConfirmSelection() {
        System.out.println("请输入你的选择(Y/N)");
        char c;
        for (; ; ) {//无限循环
        	//在这里，将接受到字符，转成了大写字母
        	//y => Y n=>N
            String str = readKeyBoard(1, false).toUpperCase();
            c = str.charAt(0);
            if (c == 'Y' || c == 'N') {
                break;
            } else {
                System.out.print("选择错误，请重新输入：");
            }
        }
        return c;
    }

    /**
     * 功能： 读取一个字符串
     * @param limit 读取的长度
     * @param blankReturn 如果为true ,表示 可以读空字符串。 
     * 					  如果为false表示 不能读空字符串。
     * 			
	 *	如果输入为空，或者输入大于limit的长度，就会提示重新输入。
     * @return
     */
    private static String readKeyBoard(int limit, boolean blankReturn) {
        
		//定义了字符串
		String line = "";

		//scanner.hasNextLine() 判断有没有下一行
        while (scanner.hasNextLine()) {
            line = scanner.nextLine();//读取这一行
           
			//如果line.length=0, 即用户没有输入任何内容，直接回车
			if (line.length() == 0) {
                if (blankReturn) return line;//如果blankReturn=true,可以返回空串
                else continue; //如果blankReturn=false,不接受空串，必须输入内容
            }

			//如果用户输入的内容大于了 limit，就提示重写输入  
			//如果用户如的内容 >0 <= limit ,我就接受
            if (line.length() < 1 || line.length() > limit) {
                System.out.print("输入长度（不能大于" + limit + "）错误，请重新输入：");
                continue;
            }
            break;
        }

        return line;
    }
}

```

House.java
```java
package com.houserent.domain;

/**
 * House类对象表示一个房屋信息
 */
public class House {
    private int id;//编号
    private String name;//房主
    private String phone;//电话
    private String address;//地址
    private int rent;//租金
    private String state;//状态

    private House prev = null;
    private House next = null;

    public House(int id, String name, String phone, String address, int rent, String state) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.rent = rent;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRent() {
        return rent;
    }

    public void setRent(int rent) {
        this.rent = rent;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public House getPrev() {
        return prev;
    }

    public void setPrev(House prev) {
        this.prev = prev;
    }

    public House getNext() {
        return next;
    }

    public void setNext(House next) {
        this.next = next;
    }

    @Override
    public String toString() {
        return id +
                "\t\t" + name +
                "\t\t" + phone +
                "\t\t" + address +
                "\t\t" + rent +
                "\t\t" + state;
    }
}
```

HouseView.java
```java
package com.houserent.view;

import com.houserent.domain.House;
import com.houserent.service.HouseService;
import com.houserent.utils.Utility;

public class HouseView {
    //1. 编写mainMenu方法，可以显示主菜单
    private boolean loop = true;
    private char key = ' ';
    private HouseService houseService = new HouseService();

    public void waiting() {
        System.out.println("\n按回车返回菜单……");
        Utility.readString(0, "");
        return;
    }

    public void delHouse() {
        System.out.println("==================删除房屋==================");
        System.out.print("请输入待删除的房屋的id(-1退出): ");
        int delId = Utility.readInt();
        if (delId == -1) {
            System.out.println("\n放弃修改信息……\n");
            return;
        }
        System.out.println("请确认是否删除, 小心选择");
        char choice = Utility.readConfirmSelection();

        if (choice == 'Y') {
            if(houseService.del(delId)) {
                System.out.println("==================删除房屋成功==================");
            } else {
                System.out.println("找不到房屋！！");
            }
        } else {
            System.out.println("\n放弃修改信息……\n");
        }
    }

    public void findhouse() {
        System.out.println("==================查看房屋==================");
        System.out.print("请输入id: ");
        int id = Utility.readInt();
        House house = houseService.findById(id);

        if (house != null) {
            System.out.println("房屋信息如下: ");
            System.out.println("编号\t\t房主\t\t电话\t\t地址\t\t月租\t\t状态(未出租/已出租)");
            System.out.println(house);
        } else {
            System.out.println("id不存在!");
        }
    }

    public void exit() {
        System.out.println("确定要退出吗?");
        char c = Utility.readConfirmSelection();
        if (c == 'Y') {
            loop = false;
        }
    }

    public void updateHouse() {
        System.out.println("==================修改房屋==================");
        System.out.print("请输入要修改的房屋id(-1退出，无需修改处回车即可): ");
        int id = Utility.readInt();
        if (id == -1) {
            System.out.println("\n放弃修改信息……\n");
            return;
        }
        House house = houseService.findById(id);
        if (house != null) {
            System.out.print("姓名("+house.getName()+"): ");
            String name = Utility.readString(6, house.getName());
            house.setName(name);
            System.out.print("电话("+house.getPhone()+"): ");
            String phone = Utility.readString(12, house.getPhone());
            house.setPhone(phone);
            System.out.print("地址("+house.getAddress()+"): ");
            String address = Utility.readString(16, house.getAddress());
            house.setAddress(address);
            System.out.print("月租("+house.getRent()+"): ");
            int rent = Utility.readInt(house.getRent());
            house.setRent(rent);
            System.out.print("状态("+house.getState()+"): ");
            String state = Utility.readString(3, house.getState());
            house.setState(state);

            System.out.println("==================修改房屋成功==================");
        } else {
            System.out.println("id不存在!");
        }
    }
    //添加house对象
    public void addHouse() {
        System.out.println("==================添加房屋==================");
        System.out.print("姓名: ");
        String name = Utility.readString(6);
        System.out.print("电话: ");
        String phone = Utility.readString(12);
        System.out.print("地址: ");
        String address = Utility.readString(16);
        System.out.print("月租: ");
        int rent = Utility.readInt();
        System.out.print("状态: ");
        String state = Utility.readString(3);

        if (houseService.add(new House(0, name, phone, address, rent, state))) {
            System.out.println("==================添加房屋成功==================");
        } else {
            System.out.println("==================添加房屋失败==================");
        }
    }

    public void listHouse() {
        System.out.println("==================房屋列表==================");
        System.out.println("编号\t\t房主\t\t电话\t\t地址\t\t月租\t\t状态(未出租/已出租)");
        House house = houseService.getHead();
        while (house != null) {
            System.out.println(house);
            house = house.getNext();
        }

        System.out.println("===============房屋列表显示完毕===============");
    }

    public void mainMenu() {
        do {
            System.out.println("===============房屋出租系统菜单===============");
            System.out.println("\t\t\t   1 新 增 房 屋");
            System.out.println("\t\t\t   2 查 找 房 屋");
            System.out.println("\t\t\t   3 删 除 房 屋 信 息");
            System.out.println("\t\t\t   4 修 改 房 屋 信 息");
            System.out.println("\t\t\t   5 房 屋 列 表");
            System.out.println("\t\t\t   6 退      出");
            System.out.print("请输入你的选择(1-6): ");
            key = Utility.readChar();

            switch (key) {
                case '1':
                    addHouse();
                    waiting();
                    break;
                case '2':
                    findhouse();
                    waiting();
                    break;
                case '3':
                    delHouse();
                    waiting();
                    break;
                case '4':
                    updateHouse();
                    waiting();
                    break;
                case '5':
                    listHouse();
                    waiting();
                    break;
                case '6':
                    exit();
                    break;
            }
        } while (loop);
    }
}
```

HouseService.java
```java
package com.houserent.service;

import com.houserent.domain.House;

public class HouseService {
    private House head = null;
    private int idCounter = 0; //记录当前id

    public House getHead() {
        return head;
    }

    public House findById(int id) {
        House house = head;
        if (id >= 1) {
            while (house != null) {
                if (house.getId() == id) {
                    return house;
                }
                house = house.getNext();
            }
        }
        return null;
    }

    public HouseService() {
        House house = new House(1, "humou", "911", "红魔殿", 1145, "未出租");
        add(house);
    }

    public boolean add(House newHouse) {
        newHouse.setId(++idCounter);
        House prev = head;

        if (prev == null) {
            head = newHouse;
            return true;
        } else {
            while (prev.getNext() != null) {
                prev = prev.getNext();
            }
            prev.setNext(newHouse);
            newHouse.setPrev(prev);
            return true;
        }
    }

    public boolean del(int delId) {
        House cur = findById(delId);
        if (cur == null) {
            return false;
        } else if (cur == head) {
            head = head.getNext();
            return true;
        } else {
            cur.getPrev().setNext(cur.getNext());
            cur.getNext().setPrev(cur.getPrev());
            cur = null;
            return true;
        }
    }
}
```

HouseRentApp.java
```java
package com.houserent;

import com.houserent.view.HouseView;

public class HouseRentApp {
    public static void main(String[] args) {
        // 整个程序的入口
        new HouseView().mainMenu();
        System.out.println("已退出系统");
    }
}

```

## 接口的应用/工厂方法

```java
package com.EBAOBAO1.Homeworks;

public class Homework05 {
    public static void main(String[] args) {
        Person person = new Person("EBAOBAO");
        person.pass();
        person.passRiver();
    }
}

class Person {
    private String name;
    private Vehicles vehicle;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Vehicles getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicles vehicle) {
        this.vehicle = vehicle;
    }

    public Person(String name) {
        this.name = name;
    }

    // 要把具体过程封装为方法!!!

    public void passRiver() {
        if (!(this.getVehicle() instanceof Boat)) {
            this.setVehicle(VehiclesFactory.provideBoat());
        }
        vehicle.work();
    }

    public void pass() {
        if (!(this.getVehicle() instanceof Horse)) {
            this.setVehicle(VehiclesFactory.provideHorse());
        }
        vehicle.work();
    }
}

interface Vehicles {
    void work();
}

class Horse implements Vehicles {
    private Horse() {}
    public static Horse getHorseInstace() {
        return new Horse();
    }
    @Override
    public void work() {
        System.out.println("*郭德纲*");
    }
}

class Boat implements Vehicles {
    @Override
    public void work() {
        System.out.println("*bbbbeeeaaannn*");
    }
}

class VehiclesFactory {
    private VehiclesFactory() {}
    public static Horse provideHorse() {
        return Horse.getHorseInstace();
    }

    public static Boat provideBoat() {
        return new Boat();
    }
}
```

## 内部类练习

```java
package com.EBAOBAO1.Homeworks;

public class Homework03 {
    public static void main(String[] args) {
        new Cellphone().testWork(new Calculater() {
            @Override
            public double work(double n1, double n2) {
                return n1 * n2;
            }
        }, 2, 3);
    }
}

interface Calculater {
    double work(double n1, double n2);
}

class Cellphone {
    public void testWork(Calculater calculater, double n1, double n2) {
        double result = calculater.work(n1, n2);
        System.out.println(result); 
    }
}
```

```java
package com.EBAOBAO1.Homeworks;

public class Homework06 {
    public static void main(String[] args) {
        Car car = new Car(123);
        car.getAir().flow();
    }
}

class Car {
    private double temperature;

    class Air {
        public void flow() {
            if (temperature > 40) {
                System.out.println("*cool~*");
            } else if (temperature < 0) {
                System.out.println("*warm~*");
            } else {
                System.out.println("*shut down*");
            }
        }
    }

    public Air getAir() {
        return new Air();
    }

    public Car(double temperature) {
        this.temperature = temperature;
    }
}

```

## 完善的链表

# 坦克小战

## java绘图

### 坐标体系

原点位于左上角，以像素为单位。x坐标表示水平方向，y坐标表示垂直方向。

计算机在屏幕上显示的内容都是由屏幕上的每一个像素组成的。一个像素的大小取决于屏幕尺寸与其分辨率，故你不能说一个像素=多少厘米。

### 实现

```java
package com.EBAOBAO.tank;  
  
import javax.swing.*;  
import java.awt.*;  
  
public class DrawCircle {  
    public static void main(String[] args) {  
        JFrame jFrame = new JFrame(); // 1. 新建一个画框  
        // 2. 新建一个面板并重写其 paint() 方法  
        JPanel myPanel = new JPanel() {  
            @Override  
            public void paint(Graphics g) {  
                super.paint(g);// 注意这句是必须的  
                g.drawOval(10, 10, 100, 100);// 调用 Graphics 类中相关的方法画出想画的东西  
            }  
        };  
  
        jFrame.add(myPanel);// 3. 将面板塞进画框里  
        // 然后进行一些初始化  
        jFrame.setSize(400, 300);// 设置窗口尺寸  
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);// 设置点击关闭的时候程序终止  
        // 4. 使窗口可见  
        jFrame.setVisible(true);  
    }  
}
```

这里，使用 `drawOval` 方法来绘制一个椭圆。

### 原理

Component 类提供了两个与绘图相关的最重要的方法：

1. `paint(Graphics g)`: 绘制组件外观
2. `repaint()`: 刷新组件外观

而在以下情况下，程序会调用 `paint()` 方法来绘制组件：

1. 第一次屏幕显示时。
2. 窗口最小化，再放大。
3. 窗口大小发生变化。
4. `repaint` 被调用。

Graphics 类提供了许多绘图方法，你可以将其对象就理解为一支画笔：

`drawLine(int x1, int y1, int x2, int y2)`
: 直线

`drawRect(int x1, int y1, int width, int height)`
: 矩形边框

`drawOval(int x1, int y1, int width, int height)`
: 椭圆边框

`fillRect(int x1, int y1, int width, int height)`
: 填充矩形

`fillOval(int x1, int y1, int width, int height)`
: 填充椭圆

`drawImage(Image img, int x, int y, ..)`
: 图片

`drawString(String str, int x, int y)`
: 文本

`setfont(Font font)`
: 设置字体

`setColor(Color c)`
: 设置画笔颜色（Color 类中有一些静态属性，也可以看看它的那些构造器）

示例：

```java
Image img = Toolkit.getDefaultToolkit().getImage(Panel.class.getResource("/bg.png")); 
// 这里的路径是从out->项目根目录开始读取的 
g.drawImage(img, 10, 10, this);
```

```java
g.setColor(Color.red);
```

```java
g.setFont(new Font("黑体", Font.BOLD, 50));
//  字体，风格，大小
```

[Java中的Font类详解-CSDN博客](https://blog.csdn.net/weixin_30220993/article/details/114030052)

## 事件处理机制

通过让面板实现 KeyListener 接口来实现对事件的响应：

```java
// KeyListener 是键盘监听器，可监听键盘事件  
class Panel extends JPanel implements KeyListener {  
    int x = 10;  
    int y = 10;  
    @Override  
    public void paint(Graphics g) {  
        super.paint(g);  
        g.fillOval(x, y, 20, 20);  
    }  
  
    // 有字符输出时，该方法被触发  
    @Override  
    public void keyTyped(KeyEvent e) {  
  
    }  
  
    // 键按下时，该方法被触发  
    @Override  
    public void keyPressed(KeyEvent e) {  
        // Java中会为每一个键分配一个Code（int类型）  
        if (e.getKeyCode() == KeyEvent.VK_DOWN) {  
            y += 10;  
        }  
        this.repaint();  
    }  
  
    // 键松开时，该方法被触发  
    @Override  
    public void keyReleased(KeyEvent e) {  
  
    }  
}
``` 

在使用时，记得调用框架的 `addKeyListener(KeyListener l)` 方法，相关面板对象即为传入的参数。

```java
jFrame.addKeyListener(myPanel);
```