
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
			$box = $ui->box()->title('View Project Status')->solid()->uiType('primary')->open();
				if(count($projects)>0){

					$table = $ui->table()->hover()->bordered()->open();

				?>
						<thead>
							<tr>

                <th>project unique identification</th>
                <th>outsource status</th>
								<th>outsource duration</th>

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

											<td><?= $project['outsource_id'] ?>  </td>
											<td><?= $project['status_desc'] ?>  </td>
                      <td><?= $project['outsource_duration'] ?>  </td>






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


<script type="text/javascript">

//print($project['count']);
var count=<?=$project['count'] ?>;
window.onload = function () {

  count=count* 0.25;
  console.log(count);
	var chart = new CanvasJS.Chart("chartContainer",
	{
		title:{
			text: "Running Status"
		},
		legend: {
			maxWidth: 350,
			itemWidth: 120
		},
		data: [
		{
			type: "doughnut",
			showInLegend: true,
			legendText: "{indexLabel}",
			dataPoints: [
				{ y: count, indexLabel: "complete" },
				{ y: 1-count, indexLabel: "incomplete"}
			]
		}
		]
	});
	chart.render();
}
</script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<div id="chartContainer" style="height: 300px; width: 100%;"></div>

