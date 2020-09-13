<?php

class Admin extends Controller {

    public function __construct() {
        if ( !isUserSuperAdmin())  {
            redirect('users/login');
        } 
        
        $this->adminModel = $this->model('Admins');
        $this->deptModel = $this->model('Department');
        $this->activityModel = $this->model('Activitylogs');
        $this->empModel = $this->model('Employee');
    }

    public function index() {
        $countDepts = $this->deptModel->countDepartments();
        $userActivity = $this->activityModel->getUserActivity();
        $countEmp = $this->empModel->countEmployees();

        $data = [
            'title'         => 'Welcome',
            'description'   => '',
            'departments'   => $countDepts,
            'employees'     => $countEmp,
            'activity'      => $userActivity
        ];

        $this->view('admin/index', $data);
    }

    public function company() {
        $comp = $this->adminModel->getCompany();
        $parish = $this->adminModel->parishes();
        $data = [
            'title'             => 'Company Settings',
            'compUrl'           => $comp->compUrl,
            'companyname'       => $comp->companyname,
            'contactPerson'     => $comp->contactPerson,
            'address'           => $comp->address,
            'parish'            => $comp->parish,
            'city'              => $comp->city,
            'email'             => $comp->email,
            'main_phone'        => $comp->main_phone,
            'secondary_phone'   => $comp->secondary_phone,
        ];

        $this->view('admin/company', $data);
    }

    public function validateCompanyName() {
        if(isset($_POST['companyname'])) {   
            if(empty($_POST['companyname'])) {
               echo 'Field cannot be empty!';
            }
        } 
    }


    public function edit() {

        $comp = $this->adminModel->getCompany();
        $parish = $this->adminModel->parishes();

        if ($_SERVER["REQUEST_METHOD"] == "POST") {

            /*
             * Process Form
            */
            // Sanitize POST data
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            //$companyInfo = $this->adminModel->getCompany();

            $data = [
                'title'             => 'Company Settings',
                'compUrl'           => trim($_POST['compUrl']),
                'companyname'       => trim($_POST['companyname']),
                'contactPerson'     => trim($_POST['contactPerson']),
                'modified_date'     => date("Y-m-d H:i:s"),
                'companyname_err'   => ''
                

                /* 'empTitle'          => trim($_POST['empTitle']),
                'first_name'        => trim($_POST['first_name']),
                'middle_name'       => trim($_POST['middle_name']),
                'last_name'         => trim($_POST['last_name']),
                'empDOB'            => trim($_POST['empDOB']),
                'gender'            => trim($_POST['gender']),
                'empEmail'          => trim($_POST['empEmail']),
                'hire_date'         => trim($_POST['hiredOn']),
                
                'created_by'        => $_SESSION['userID']
                /'hiredOn_err'       => '',
               // 'created_by'        => $_SESSION['userID'] */
            ];

            // Validate deptCode
            if(empty($data['companyname'])) {
                flashMessage('save_error', 'Field Cannot be empty!', 'alert alert-warning');
                $this->view('admin/company', $data);
            }

            if( empty($data['companyname_err'])  ) {
                if($this->adminModel->updateCompany($data)) {
                    flashMessage('add_success', 'Company Information updated successfully!', 'alert alert-success');
                    redirect('admin/company');
                } else {
                    flashMessage('save_error', 'Field Cannot be empty!', 'alert alert-warning');
                } 
            }
        }
        else {
            // Get existing Company Information from model
            $data = [
                'title'             => 'Company Settings',
                'description'       => '',
                'compUrl'           => $comp->compUrl,
                'companyname'       => $comp->companyname,
                'contactPerson'     => $comp->contactPerson,
                'address'           => $comp->address,
                'parish'            => $comp->parish,
                'city'              => $comp->city,
                'email'             => $comp->email,
                'main_phone'        => $comp->main_phone,
                'secondary_phone'   => $comp->secondary_phone,

              
                'companyname_err'   => ''
            ];

            $this->view('admin/company', $data);
        }

        //getCompany
       
       
    }




}







    /* BEGIN Employees  */

   /* 

   
    public 'id' => string '' (length=0)
    public 'companyname' => string 'Mayer and Barry Trading' (length=23)
    public 'siteurl' => string 'Error iusto deserunt' (length=20)
    public 'address' => string '55 Rosu Road' (length=12)
    public 'contactPerson' => string '' (length=0)
   
   public function allemployees() {

        $emp_list = $this->adminModel->getEmployees();

        $data = [
            'title' => 'Employee List',
            'employees' => $emp_list
        ];
        $this->view('admins/allemployees', $data);
    } 


    public function addemployee() {
        $data = [
            'title' => 'add emp',
            'description' => 'HR Management'
        ];
        $this->view('admins/addemployee', $data);
    } */



/*


  public function add() {
        
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
         
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

            $departments = $this->deptModel->getDepartments();
            
            $data = [
                'title'             => 'New Employee Pre-Registration',
                'singular'          => 'Employee Details',
                'description'       => 'Add Employee',
                'departments'       => $departments,
                'empID'             => trim($_POST['empNo']),
                'empTitle'          => trim($_POST['empTitle']),
                'first_name'        => trim($_POST['first_name']),
                'middle_name'       => trim($_POST['middle_name']),
                'last_name'         => trim($_POST['last_name']),
                'empDOB'            => trim($_POST['empDOB']),
                'gender'            => trim($_POST['gender']),
                'empEmail'          => trim($_POST['empEmail']),
                'hire_date'         => trim($_POST['hiredOn']),
                'created_date'      => date("Y-m-d H:i:s"),
                'created_by'        => $_SESSION['userID'],
                'empID_err'         => '',
                'empTitle_err'      => '',
                'first_name_err'    => '',
                'last_name_err'     => '',
                'empDOB_err'        => '',
                'gender_err'        => '',
                'empEmail_err'      => '',
                'hiredOn_err'       => '',
                'created_by'        => $_SESSION['userID']
            ];

            // Validate empID
            if(empty($data['empID'])) :
                $data['empID_err'] = 'Please enter an employee ID';
            elseif (strlen($data['empID']) > 6) :
                $data['empID_err'] = 'Employee ID should be 6 characters or less';
            else :
                if($this->empModel->findEmpByID($data['empID'])) :
                    $data['empID_err'] = 'Employee ID already exists';
                endif;
            endif;

            // Validate First Name
            if(empty($data['first_name'])) :
                $data['first_name_err'] = 'Please enter a First Name';
            endif;

            // Validate Last Name
            if(empty($data['last_name'])) :
                $data['last_name_err'] = 'Please enter a Last Name';
            endif;

            // Validate empDOB
            if(empty($data['empDOB'])) :
                $data['empDOB_err'] = 'Please enter Date';
            elseif (!isRealDate($data['empDOB'])) :
                $data['empDOB_err'] = 'Invalid Date';
            endif;

            // Validate Hired Date
            if(empty($data['hire_date'])) :
                $data['hiredOn_err'] = 'Please enter Date';
            elseif (!isRealDate($data['hire_date'])) :
                $data['hiredOn_err'] = 'Invalid Date';
            endif;

            // Filter Email
            if (filter_var($data['empEmail'], FILTER_VALIDATE_EMAIL)) :
                $data['empEmail_err'] = 'Invalid Email Address';
            endif;

            // Validate Gender
            if (!isset($_POST['gender']  ) ) :
                $data['gender_err'] = 'Choose one';
            endif;

            // Make sure errors are empty
            if( empty($data['empID_err']) && empty($data['first_name_err']) 
                && empty($data['last_name_err']) && empty($data['empDOB_err']) 
                && empty($data['gender_err'])  ) :

                // Validated, then Add Employee
                if($this->empModel->addEmployee($data)) :
                    $this->empModel->addEmail($data);
                    
                    //$this->empModel->addDept($data);
                    flashMessage('add_sucess', 'Employee registered successfully! <a class="text-white" href="' . URLROOT . '/employees">Click here</a> to complete registration', 'alert alert-success bg-primary text-white');

                   // flashMessage('add_sucess', 'Employee registered successfully! <a class="text-white" href="' . $newID . '">Click here</a> to complete registration', 'alert alert-success bg-primary text-white');
                    //flashSection('complete_reg', 'Employee registered successfully! <br/> Click here to Complete Registration ', 'p-3 mb-2 bg-primary text-white shadow-sm');
                   // echo PDO::lastInsertId();
                
                    redirect('employees/add');
                else :
                    flashMessage('add_error', 'Something went wrong!', 'alert alert-warning');
                endif;
            else :
                flashMessage('update_failure', 'Save Error! Please review form.', 'alert alert-warning');
                // Load view with errors
                $this->view('employees/add', $data);
            endif;

        } 
        else {

            $employees = $this->empModel->getEmployees();
            $departments = $this->deptModel->getDepartments();
           
            $data = [
                'title'             => 'New Employee Pre-Registration',
                'singular'          => 'Employee Details',
                'description'       => 'Add Employee',
                'departments'       => $departments,
                'empID'             => '',
                'empTitle'          => '',
                'first_name'        => '',
                'middle_name'       => '',
                'last_name'         => '',
                'empDOB'            => '',
                'gender'            => '',
                'empEmail'          => '',
                'hire_date'         => '',

                'empID_err'         => '',
                'empTitle_err'      => '',
                'first_name_err'    => '',
                'last_name_err'     => '',
                'empDOB_err'        => '',
                'gender_err'        => '',
                'empEmail_err'      => '',
                'hiredOn_err'       => ''
            ];

            $this->view('employees/add', $data);
        }
    }

*/