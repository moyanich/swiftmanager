<?php

class Admins extends Controller {

    public function __construct() {
        if ( !isUserSuperAdmin())  {
            redirect('users/login');
        } 
        $this->adminModel = $this->model('Admin');
    }

    public function index() {
        $data = [
            'title' => 'Welcome',
            'description' => '',
        ];
        $this->view('admins/index', $data);
    }

    public function dashboard() {
        $data = [
            'title' => 'Dashboard',
            'description' => ''
        ];
        $this->view('admins/dashboard', $data);
    }

    /* BEGIN Employees  */

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
    } 

   
} 