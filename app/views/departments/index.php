<?php require APPROOT . '/views/inc/header.php'; ?>


<?php flashMessage('delete_success'); ?>


<!-- Page-Title -->
<div class="row">
   <div class="col-sm-12">
      <div class="page-title-box">
         <div class="row">
            <div class="col">
               <h4 class="page-title"><?php echo $data['title']; ?></h4>
            </div>
            <!--end col-->
            <div class="col-auto align-self-center">
               <a href="#" class="btn btn-sm btn-outline-primary" id="Dash_Date">
                  <span class="day-name" id="Day_Name">Today:</span>&nbsp; <span class="" id="Select_date">Aug 28</span> 
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-self-center icon-xs ml-1">
                     <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                     <line x1="16" y1="2" x2="16" y2="6"></line>
                     <line x1="8" y1="2" x2="8" y2="6"></line>
                     <line x1="3" y1="10" x2="21" y2="10"></line>
                  </svg>
               </a>
               <a href="#" class="btn btn-sm btn-outline-primary">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-download align-self-center icon-xs">
                     <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                     <polyline points="7 10 12 15 17 10"></polyline>
                     <line x1="12" y1="15" x2="12" y2="3"></line>
                  </svg>
               </a>
            </div>
            <!--end col-->
         </div>
         <!--end row-->
      </div>
      <!--end page-title-box-->
   </div>
   <!--end col-->
</div>
<!--end row--><!-- end page title end breadcrumb -->

<div class="row">
	<div class="col-12">
		<div class="card card-departments shadow">
			<div class="card-header">
				<h4 class="card-title"><?php echo $data['title']; ?></h4>
				<p class="text-muted"><?php echo $data['description']; ?></p>
				<ul class="card-button">
					<li><a href="<?php echo URLROOT ?>/departments/add" class="btn btn-primary btn-sm">Add New</a></li>
				</ul>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="deptTable">
						<thead>
							<tr>
								<th scope="col">Department ID</th>
								<th scope="col">Department Code</th>
								<th scope="col">Department Name</th>
								<!--<th scope="col">Manager</th>
								<th scope="col">Supervisor</th>-->
								<!--<th scope="col">Total Employees</th>-->
								<th scope="col">Actions</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							foreach ($data['departments'] as $dept) {
								echo '<tr>';
									echo '<td>' . $dept->id . '</td>';
									echo '<td>' . $dept->deptCode . '</td>';
									echo '<td>' . $dept->deptName . '</td>';
									echo '<td class="actions"><a href="' . URLROOT. '/departments/edit/' . $dept->id . '" class="mr-3" data-toggle="tooltip" data-placement="top" title="Edit ' . $data['title'] . '"><i class="far fa-edit"></i></a>
									<a href="javascript:void(0);" data-toggle="modal" data-target="#delModal-' . $dept->id . '"><i class="far fa-trash-alt"></i></a></td>';
								echo '</tr>';
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<?php foreach ($data['departments'] as $dept) { ?>

	<!-- Modal -->
	<div class="modal custom-modal fade" id="delModal-<?php echo $dept->id; ?>" tabindex="-1" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="form-header">
						<h4>Delete <?php echo $dept->deptName ?></h4>
						<p>Are you sure want to Delete this <?php echo $data['singlular']; ?>?</p>
					</div>
					<div class="modal-buttons delete-action">
						<div class="row">
							<div class="col-6">
								<form action="<?php echo URLROOT; ?>/departments/delete/<?php echo $dept->id ?>" method="post">
									<input type="submit" value="Delete" class="btn btn-primary del-btn modal-btn">
								</form>
							</div>
							<div class="col-6">
								<a href="javascript:void(0);" data-dismiss="modal" class="btn btn-primary cancel-btn modal-btn">Cancel</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





<?php } ?>




<?php require APPROOT . '/views/inc/footer.php'; ?>


<?php /*
							foreach ($data['departments'] as $dept) {
								echo '<tr>';
									echo '<td>' . $dept->id . '</td>';
									echo '<td>' . $dept->deptCode . '</td>';
									echo '<td>' . $dept->deptName . '</td>';
									echo '<td class="actions"><a href="' . URLROOT. '/departments/edit/' . $dept->id . '" class="mr-3" data-toggle="tooltip" data-placement="top" title="Edit ' . $data['title'] . '"><i class="far fa-edit"></i></a>
									<!--<a href="' . URLROOT. '/departments/delete/' . $dept->id . '" class="" data-toggle="tooltip" data-original-title="Delete ' . $data['title'] . '"><i class="far fa-trash-alt"></i></a>-->

									<button type="button" class="btn btn-link" data-toggle="modal" data-target="#delModal-' . $dept->id . '"><i class="far fa-trash-alt"></i></button>
									
									
									</td>';
								echo '</tr>';
							} */
							?>