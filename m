Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1560352A61
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 14:22:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IEMf8h021278
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 09:22:41 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IEMfXX032305
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 09:22:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Mar 2014 09:22:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IEMefD002627;
	Tue, 18 Mar 2014 09:22:41 -0500
Date: Tue, 18 Mar 2014 10:22:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin Cooper Jr." <fcooper@ti.com>
Message-ID: <20140318142240.GV12929@edge>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-2-git-send-email-denis@denix.org>
	<loom.20140318T150747-911@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20140318T150747-911@post.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH 1/5] run-opentest: make assigning tests to a specific TEE optional
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Mar 2014 14:22:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 18, 2014 at 02:10:23PM +0000, Franklin Cooper Jr. wrote:
> Denys Dmytriyenko <denis@...> writes:
> 
> 
> 
> > 
> 
> > From: Denys Dmytriyenko <denys@...>
> 
> > 
> 
> > Signed-off-by: Denys Dmytriyenko <denys@...>
> 
> > ---
> 
> >  lib/run-opentest |   12 ++++++++++--
> 
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> > 
> 
> > diff --git a/lib/run-opentest b/lib/run-opentest
> 
> > index 98a7dc8..c502764 100644
> 
> > --- a/lib/run-opentest
> 
> > +++ b/lib/run-opentest
> 
> >  <at>  <at>  -213,6 +213,14  <at>  <at>  run_target_side_test() {
> 
> >          OPENTEST_TEE_IP="128.247.105.52"
> 
> >      fi
> 
> > 
> 
> > +    # if OPENTEST_TEE_IP is set to "none", disable assigning to a 
> specific TEE
> 
> > +    if [ "$OPENTEST_TEE_IP" == "none" ]
> 
> > +    then
> 
> > +        ASSIGN_TO_TEE=""
> 
> > +    else
> 
> > +        ASSIGN_TO_TEE="~assign_to_tees=\"vatf on $OPENTEST_TEE_IP\""
> 
> > +    fi
> 
> > +
> 
> 
> 
> I thought if you didn't specify a TEE nearby it can cause problems when 
> your NFS directory is 100s of miles away from the TEE.

There's another option to request a specific farm. So, you have to specify 
either TEE or a specific farm. I need this in order to request boards from 
TIGT farm, that has several TEEs.


> >      # if OPENTEST_HW_CAP is not set in config, default to "linux"
> 
> >      if [ -z $OPENTEST_HW_CAP ]
> 
> >      then
> 
> >  <at>  <at>  -220,8 +228,8  <at>  <at>  run_target_side_test() {
> 
> >      fi
> 
> > 
> 
> >      # Call opentest framework.  Echo the command being used for logging
> 
> > -    echo "java -jar opentest_cli_0.7.jar --template penguin --hw
> 
> > platform=$oplatform,$OPENTEST_HW_CAP --sw
> 
> > 
> kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir~assign
> _to_tees=\"vatf
> 
> > on $OPENTEST_TEE_IP\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
> 
> > -    java -jar opentest_cli_0.7.jar --template penguin --hw 
> platform=$oplatform,$OPENTEST_HW_CAP --sw
> 
> > 
> kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir~assign
> _to_tees="vatf
> 
> > on $OPENTEST_TEE_IP" --params script=/$TEST_SCRIPTS_TGT/opentest.sh
> 
> > +    echo "java -jar opentest_cli_0.7.jar --template penguin --hw
> 
> > platform=$oplatform,$OPENTEST_HW_CAP --sw
> 
> > 
> kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN
> _TO_TEE
> 
> > --params script=/$TEST_SCRIPTS_TGT/opentest.sh"
> 
> > +    java -jar opentest_cli_0.7.jar --template penguin --hw 
> platform=$oplatform,$OPENTEST_HW_CAP --sw
> 
> > 
> kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN
> _TO_TEE
> 
> > --params script=/$TEST_SCRIPTS_TGT/opentest.sh
> 
> > 
> 
> >  
> ############################################################################
> ####
> 
> >  # Check the results of the opentest run.
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

