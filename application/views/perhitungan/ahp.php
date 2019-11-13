<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-tag"></i> Calculation Results for AHP
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">

            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">Enter Criteria Details</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                        <pre><?php
                            $n=0;
                            foreach($weight as $wg):
                                echo "$wg[weight] \t";
                                if($n++%3 == 2)
                                    echo "
";
                            endforeach;
                        ?>
                        </pre>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                </div>
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
<script>
    $('.switch').on('click',function(){
        var data = $(this).data('id');

        var tempId1 = $('#id_subcriteria1-'+data).val();
        var tempNama1 = $('#name1-'+data).html();
        var tempId2 = $('#id_subcriteria2-'+data).val();
        var tempNama2 = $('#name2-'+data).html();

        var tempLog1 = $('#log_name1-'+data).val();
        var tempLog2 = $('#log_name2-'+data).val();

        $('#id_subcriteria1-'+data).val(tempId2);
        $('#name1-'+data).html(tempNama2);
        $('#id_subcriteria2-'+data).val(tempId1);
        $('#name2-'+data).html(tempNama1);

        $('#log_name1-'+data).val(tempLog2);
        $('#log_name2-'+data).val(tempLog1);
    });
</script>