<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-tag"></i> Weight Criteria
        <small>Update Weight Criteria</small>
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Enter Weight Criteria</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addCriteria" action="<?php echo base_url('weight_criteria/addOrEdit') ?>" method="post" role="form">
                        <div class="box-body">
                        <?php
                        $count=0;
                        if(count($weight) != 0):
                            foreach($weight as $we):
                        ?>
                            <div class="row" style="margin-bottom:15px">
                                <div class="col-md-12">                                
                                    <div class="input-group">
                                        <span class="input-group-addon" id="name1-<?=$count?>"><?=$we['log_name1']?></span>
                                        <input type="hidden" id="log_name1-<?=$count?>" value="<?=$we['log_name1']?>" name="input[<?=$count?>][log_name1]">
                                        <input type="hidden" id="log_name2-<?=$count?>" value="<?=$we['log_name2']?>" name="input[<?=$count?>][log_name2]">
                                        <input type="hidden" id="id_criteria1-<?=$count?>" value="<?=$we['id_criteria1']?>" name="input[<?=$count?>][id_criteria1]">
                                        <input type="hidden" id="id_criteria2-<?=$count?>" value="<?=$we['id_criteria2']?>" name="input[<?=$count?>][id_criteria2]">
                                        <select name="input[<?=$count?>][weight]" class="form-control">
                                            <option value="1" <?=($we['weight'] == 1)?"selected":""?> >1 - Both elements are equally important</option>
                                            <option value="2" <?=($we['weight'] == 2)?"selected":""?> >2 - between 1 and 3</option>
                                            <option value="3" <?=($we['weight'] == 3)?"selected":""?> >3 - One element is a little more important than an element other</option>
                                            <option value="4" <?=($we['weight'] == 4)?"selected":""?> >4 - between 3 and 5</option>
                                            <option value="5" <?=($we['weight'] == 5)?"selected":""?> >5 - One element is more important than the other elements</option>
                                            <option value="6" <?=($we['weight'] == 6)?"selected":""?> >6 - between 5 and 7</option>
                                            <option value="7" <?=($we['weight'] == 7)?"selected":""?> >7 - One element is clearly more absolutely important than the other elements</option>
                                            <option value="8" <?=($we['weight'] == 8)?"selected":""?> >8 - between 7 and 9</option>
                                            <option value="9" <?=($we['weight'] == 9)?"selected":""?> >9 - One element is absolutely more important than the other elements</option>
                                        </select>
                                        <span class="input-group-addon" id="name2-<?=$count?>"><?=$we['log_name2']?></span>
                                        <span class="input-group-btn">
                                            <button class="btn btn-info switch" data-id="<?=$count++?>" type="button"><small class="glyphicon glyphicon-retweet"></small></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        <?php
                            endforeach;
                        else:
                            for($i=0;$i<count($criteria);$i++):
                                for($j=$i;$j<count($criteria);$j++):
                                    if($i==$j) continue;
                        ?>
                            <div class="row" style="margin-bottom:15px">
                                <div class="col-md-12">                                
                                    <div class="input-group">
                                        <span class="input-group-addon" id="name1-<?=$count?>"><?=$criteria[$i]['name']?></span>
                                        <input type="hidden" id="log_name1-<?=$count?>" value="<?=$criteria[$i]['name']?>" name="input[<?=$count?>][log_name1]">
                                        <input type="hidden" id="log_name2-<?=$count?>" value="<?=$criteria[$j]['name']?>" name="input[<?=$count?>][log_name2]">
                                        <input type="hidden" id="id_criteria1-<?=$count?>" value="<?=$criteria[$i]['id']?>" name="input[<?=$count?>][id_criteria1]">
                                        <input type="hidden" id="id_criteria2-<?=$count?>" value="<?=$criteria[$j]['id']?>" name="input[<?=$count?>][id_criteria2]">
                                        <select name="input[<?=$count?>][weight]" class="form-control">
                                            <option value="1">1 - Both elements are equally important</option>
                                            <option value="2">2 - between 1 and 3</option>
                                            <option value="3">3 - One element is a little more important than an element other</option>
                                            <option value="4">4 - between 3 and 5</option>
                                            <option value="5">5 - One element is more important than the other elements</option>
                                            <option value="6">6 - between 5 and 7</option>
                                            <option value="7">7 - One element is clearly more absolutely important than the other elements</option>
                                            <option value="8">8 - between 7 and 9</option>
                                            <option value="9">9 - One element is absolutely more important than the other elements</option>
                                        </select>
                                        <span class="input-group-addon" id="name2-<?=$count?>"><?=$criteria[$j]['name']?></span>
                                        <span class="input-group-btn">
                                            <button class="btn btn-info switch" data-id="<?=$count++?>" type="button"><small class="glyphicon glyphicon-retweet"></small></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        <?php
                                endfor;
                            endfor;
                        endif;
                        ?>
                        </div>
                        <div class="box-footer">
                            <input type="submit" class="btn btn-primary" value="Submit" />
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
<script>
    $('.switch').on('click',function(){
        var data = $(this).data('id');

        var tempId1 = $('#id_criteria1-'+data).val();
        var tempNama1 = $('#name1-'+data).html();
        var tempId2 = $('#id_criteria2-'+data).val();
        var tempNama2 = $('#name2-'+data).html();

        var tempLog1 = $('#log_name1-'+data).val();
        var tempLog2 = $('#log_name2-'+data).val();

        $('#id_criteria1-'+data).val(tempId2);
        $('#name1-'+data).html(tempNama2);
        $('#id_criteria2-'+data).val(tempId1);
        $('#name2-'+data).html(tempNama1);

        $('#log_name1-'+data).val(tempLog2);
        $('#log_name2-'+data).val(tempLog1);
    });
</script>