<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-object-ungroup"></i> Alternative Management
        <small>Add, Edit, Delete</small>
      </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12 text-right">
                <div class="form-group">
                    <a class="btn btn-primary" href="<?php echo base_url('alternative/addNew'); ?>"><i class="fa fa-plus"></i> Add New</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
            <?php
                $error = $this->session->flashdata('error');
                if($error)
                {
            ?>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo $this->session->flashdata('error'); ?>                    
            </div>
            <?php } ?>
            <?php  
                $success = $this->session->flashdata('success');
                if($success)
                {
            ?>
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo $this->session->flashdata('success'); ?>
            </div>
            <?php } ?>

            <form method="POST" action="<?php echo base_url('alternative/spesialcriteria') ?>">
                <label for="name">Spesial Criteria</label>
                <select name="id_subcriteria" class="form-control">
                <?php
                    foreach($criteria as $c):
                ?>
                    <option <?php echo ($s_criteria == $c['id'])?"selected":""; ?> value="<?=$c['id']?>"><?=$c['name']?></option>
                <?php
                    endforeach;
                ?>

                </select>
                <br>
                <input type="submit" class="btn btn-sm btn-primary">
                </form>
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Alternative List</h3>
                    <div class="box-tools">
                        <form action="<?php echo base_url('alternative') ?>" method="POST" id="searchList">
                            <div class="input-group">
                              <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                              <div class="input-group-btn">
                                <button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                              </div>
                            </div>
                        </form>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th class="text-center">Actions</th>
                    </tr>
                    <?php
                    if(!empty($alternativeRecords))
                    {
                        $i=1;
                        foreach($alternativeRecords as $record)
                        {
                    ?>
                    <tr>
                        <td><?=$i++;?></td>
                        <td><?php echo $record->name ?></td>
                        <td class="text-center">
                            <a class="btn btn-sm btn-info" href="<?php echo base_url('alternative/editOld').'/'.$record->id; ?>" title="Edit"><i class="fa fa-pencil"></i></a>
                            <a class="btn btn-sm btn-danger deleteAlternative" href="#" data-id="<?php echo $record->id; ?>" title="Delete"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                  </table>
                  
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                    <?php echo $this->pagination->create_links(); ?>
                </div>
              </div><!-- /.box -->
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    jQuery(document).ready(function(){
        
        jQuery(document).on("click", ".deleteAlternative", function(){
            var id = $(this).data("id"),
                hitURL = baseURL + "alternative/deleteAlternative",
                currentRow = $(this);
            
            var confirmation = confirm("Are you sure to delete this Alternative ?");
            
            if(confirmation)
            {
                jQuery.ajax({
                type : "POST",
                dataType : "json",
                url : hitURL,
                data : { id : id } 
                }).done(function(data){
                    console.log(data);
                    currentRow.parents('tr').remove();
                    if(data.status = true) { alert("Alternative successfully deleted"); }
                    else if(data.status = false) { alert("Alternative deletion failed"); }
                    else { alert("Access denied..!"); }
                });
            }
        });
        
        
        jQuery(document).on("click", ".searchList", function(){
            
        });
        
    });

    jQuery(document).ready(function(){
        jQuery('ul.pagination li a').click(function (e) {
            e.preventDefault();            
            var link = jQuery(this).get(0).href;            
            var value = link.substring(link.lastIndexOf('/') + 1);
            jQuery("#searchList").attr("action", baseURL + "alternative/" + value);
            jQuery("#searchList").submit();
        });
    });
</script>
