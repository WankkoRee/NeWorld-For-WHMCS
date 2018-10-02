
{if $templatefile == 'homepage' || $filename == 'contact' && !$loggedin || $templatefile == 'vps' || $templatefile == 'pricing' || $templatefile == 'features' || $filename == "cart"}
	<footer class="space">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<a class="navbar-brand" href="#">{$companyname}</a>
					<p>&copy; {$date_year} {$companyname}. {$LANG.allrightsreserved}</p>
				</div>
				<div class="col-xs-4 col-sm-2">
					<h4 class="title-head">{$LANG.footabout}</h4>
					<ul class="list-unstyled">
						<li><a href="#">None</a></li>
					</ul>
				</div>
				<div class="col-xs-4 col-sm-2">
					<h4 class="title-head">{$LANG.footproduct}</h4>
					<ul class="list-unstyled">
						<li><a href="#">None</a></li>
					</ul>
				</div>
				<div class="col-xs-4 col-sm-2">
					<h4 class="title-head">{$LANG.footsupport}</h4>
					<ul class="list-unstyled">
						<li><a href="#">None</a></li>
					</ul>
				</div>
				<div class="col-sm-2 hidden-xs hidden-sm">
					<h4 class="title-head">{$LANG.footconnect}</h4>
					<ul class="list-unstyled">
						<li><a href="#">None</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
{/if}
