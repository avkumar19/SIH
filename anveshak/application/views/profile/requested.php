
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
			$box = $ui->box()->title('View Requested Projects')->solid()->uiType('primary')->open();
				if(count($projects)>0){

					$table = $ui->table()->hover()->bordered()
								->sortable()->searchable()->paginated()
							    ->open();

				?>
						<thead>
							<tr>

								<th>outsource description</th>
								<th>outsource duration</th>
                <th>project unique identification</th>
								<th>Accept</th>
								<th>Reject</th>
							</tr>
						</thead>
						<tbody>


							<?
								if(!empty($projects))
								{
									foreach($projects as $project)
									{


							?>

										<tr>

											<td><?= $project['outsource_desc'] ?>  </td>
											<td><?= $project['outsource_duration'] ?>  </td>


											<td><?php
											    $outsource_id=$project['outsource_id'];
												$ui->button()
													->value('Click to View')
												    ->uiType('primary')
												    ->id('view')
												    ->extras('onclick="displayContact('.$outsource_id.')" data-toggle="modal" data-target="#myModal"')
												    ->show();

											?></td>
											<td>
											<a href="<?=site_url('profile/accept_project_request/'.$project['outsource_id'])?>">
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
											<a href='<?=site_url("profile/reject_project_request/".$project['outsource_id'])?>'>
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
