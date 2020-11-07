
<?php
$ui=new UI();
$row = $ui->row()->open();
?>
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">

		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Contact Details</h4>
		      </div>
		      <div class="modal-body">

		      	<span id="startup_id" style="float: left; margin-left: 5px;">sagar</span>
		      	<span id="startup_name"style="float: right; margin-right: 5px;">ss</span>

		        <?php  
		        	$table = $ui->table()->hover()->bordered()->style()
							    ->open();
					?>
					<tbody>
						<tr>
							<td>
								<span>Website</span>
							</td>
							<td>
								<span id="website"></span>
							</td>
						</tr>
						<tr>
							<td>
								<span>Email</span>
							</td>
							<td>
								<span id="email"></span>
							</td>
						</tr>
						<tr>
							<td>
								<span>Mobile Number</span>
							</td>
							<td>
								<span id="mobile"></span>
							</td>
						</tr>
						<tr>
							<td>
								<span>Phone Number</span>
							</td>
							<td>
								<span id="phone"></span>
							</td>
						</tr>
					</tbody>

				<?php	$table->close();
		        ?>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>

		  </div>
		</div>


<?php		
		$col = $ui->col()->width(12)->open();
			$box = $ui->box()->title('View Startup Registration Request')->solid()->uiType('primary')->open();
				if(count($startups)>0){

					$table = $ui->table()->hover()->bordered()
								->sortable()->searchable()->paginated()
							    ->open();
				?>
						<thead>
							<tr>							
								
								<th>Startup Name</th>							
								<th>CIN no</th>
								<th>ROC registration no</th>
								<th>Date of Incorporation</th>
								<th>Recogination No</th>
								<th>Worth</th>
								<th>View Contact Detail</th>
								<th>Accept</th>
								<th>Reject</th>
							</tr>
						</thead>
						<tbody>
				

							<?
								if(!empty($startups))
								{
									foreach($startups as $startup) 
									{
										
										
							?>			
									
										<tr>
									
											<td><?= $startup['startup_name'] ?>  </td>
											<td><?= $startup['cin_no'] ?>  </td>
											<td><?= $startup['roc_reg_no'] ?> </td>
											<td><?= $startup['incorporate_date'] ?> </td>
											<td><?= $startup['recog_no'] ?> </td>
											<td><?= $startup['worth'] ?> </td>

											<td><?php
											    $reg_id=$startup["reg_id"];
												$ui->button()
													->value('Click to View')
												    ->uiType('primary')
												    ->id('view')
												    ->extras('onclick="displayContact('.$reg_id.')" data-toggle="modal" data-target="#myModal"')
												    ->show();
											?></td>
											<td>
											<a href="<?=site_url("startup/startup_control/accept_reg_request/".$startup['reg_id'])?>">
											<?
												$ui->button()->icon($ui->icon('edit'))
													->value('Accept')
												    ->uiType('primary')
												    ->id('accept')
												    ->show();

											?>
											</a>
											</td>
											
											<td>
											<a href='<?=site_url("startup/startup_control/reject_reg_request/".$startup['reg_id'])?>'>
											<?
												$ui->button()->icon($ui->icon('trash-o'))
													->value('Reject')
												    ->uiType('danger')
												    ->id('reject')
												    ->show();

											?>
											</a>
											</td>
										</tr>
							<?		
									}

								}
							?>

						</tbody>
				<?
					$table->close();
				}
				else
				{
					$ui->callout()
					   ->uiType("info")
					   ->title("No New Regsitration Available.")
					   ->desc("You do not have any new registration available to verify.")
					   ->show();
				}
			$box->close();
		$col->close();
	$row->close();
?>