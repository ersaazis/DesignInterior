<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-object-ungroup"></i> Assessment
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Enter Assessment Details</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addAlternative" action="<?php echo base_url('assessment/calculate') ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <?php
                                        $num=0;
                                        foreach($criteria as $c):
                                    ?>
                                    <div class="form-group">
                                        <label for="name"><?=$c['name']?></label>
                                        <input type="hidden" class="form-control required" value="<?=$c['id']?>" id="name" name="input[<?=$num?>][id_criteria]" maxlength="128">
                                        <select name="input[<?=$num?>][id_subcriteria]" class="form-control">
                                        <?php
                                            foreach($subcriteria[$c['id']] as $sc):
                                        ?>
                                            <option value="<?=$sc['id']?>"><?=$sc['name']?></option>
                                        <?php
                                            endforeach;
                                        ?>
                                        </select>
                                    </div>
                                    <?php
                                        $num++;
                                        endforeach;
                                    ?>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <input type="submit" class="btn btn-primary" value="Submit" />
                            <input type="reset" class="btn btn-default" value="Reset" />
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <?php
                    $this->load->helper('form');
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
                <div class="row">
                    <div class="col-md-12">
                        <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                    </div>
                </div>
            </div>
        </div>    
    </section>
</div>
<script src="<?php echo base_url(); ?>assets/js/addAlternative.js" type="text/javascript"></script>