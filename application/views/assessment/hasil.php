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
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">(AHP) Not yet in order</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addAlternative" action="<?php echo base_url('assessment/calculate') ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <table class="table">
                                        <tr>
                                            <th>Gaya Desain</th>
                                            <th>Total Bobot</th>
                                        </tr>
                                    <?php
                                        foreach($alternative as $al):
                                    ?>
                                        <tr>
                                            <td><?=$al->name?></td>
                                            <td><?=$totalBOBOT_AHP[$al->id_subcriteria]?></td>
                                        </tr>
                                    <?php
                                        endforeach;
                                    ?>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <b>Memory Usage</b> : <?=$memUsageAhp?><br>
                                    <b>Time Process</b> : <?=number_format($waktuAHP,10)?> ms<br>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">(F AHP) Not yet in order</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addAlternative" action="<?php echo base_url('assessment/calculate') ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <table class="table">
                                        <tr>
                                            <th>Gaya Desain</th>
                                            <th>Total Bobot</th>
                                        </tr>
                                    <?php
                                        foreach($alternative as $al):
                                    ?>
                                        <tr>
                                            <td><?=$al->name?></td>
                                            <td><?=$totalBOBOT_FAHP[$al->id_subcriteria]?></td>
                                        </tr>
                                    <?php
                                        endforeach;
                                    ?>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <b>Memory Usage</b> : <?=$memUsageFahp?><br>
                                    <b>Time Process</b> : <?=number_format($waktuFAHP,10)?> ms<br>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>    
    </section>
</div>
<script src="<?php echo base_url(); ?>assets/js/addAlternative.js" type="text/javascript"></script>