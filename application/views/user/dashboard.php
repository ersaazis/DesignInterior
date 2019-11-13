<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard
        <small>Control panel</small>
      </h1>
    </section>
    
    <section class="content">
        <div class="row">
            <?php
            if($role == ROLE_ADMIN)
            {
            ?>
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3><?php echo $jumUser;?></h3>
                  <p>Users</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person"></i>
                </div>
                <a href="<?php echo base_url('userListing');?>" class="small-box-footer">More Info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <?php
            }
            ?>
            <div class="<?php echo ($role == ROLE_ADMIN)?"col-md-9":"col-md-12"; ?>">
              <div class="panel panel-default">
                <div class="panel-heading">WELCOME</div>
                <div class="panel-body">
                  Welcome to the decision support system for interior design recomendations using Analitical Hierarchy Process (AHP) and Fuzzy Analitical Hierarchy Process (FAHP) methods.
                </div>
              </div>
            </div>
        </div>
    </section>
</div>