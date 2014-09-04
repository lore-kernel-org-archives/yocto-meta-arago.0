Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1821752A04
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 19:00:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84J0tIA028531
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 14:00:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84J0tKh017651
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 14:00:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 14:00:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84J0s7p018525;
	Thu, 4 Sep 2014 14:00:55 -0500
Date: Thu, 4 Sep 2014 15:00:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20140904190054.GQ18620@edge>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
	<1409851868-7389-2-git-send-email-j-stiffler@ti.com>
	<20140904173642.GK18620@edge>
	<4B26FB5A64EBA14C87266869E037F958140B1094@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958140B1094@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 2/4] package-sdks: Add configuration parameter to specify the installer prefix.
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
X-List-Received-Date: Thu, 04 Sep 2014 19:00:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Where's this name come from? You can reply off the list, if needed.


On Thu, Sep 04, 2014 at 01:56:10PM -0400, Stiffler, Jacob wrote:
> I have been using "processor-linux-sdk" for the prefix.
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, September 04, 2014 1:37 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 2/4] package-sdks: Add configuration parameter to specify the installer prefix.
> 
> Just a quick question - what do you plan to use instead of "ti-sdk" prefix?
> 
> 
> On Thu, Sep 04, 2014 at 01:31:06PM -0400, Jacob Stiffler wrote:
> > * The configuration parameter INSTALLER_PREFIX is used to set the prefix of the i
> >   installer filename and the default installation directory.
> > * This parameter must be set when PRODUCTIZE_SDK="true"
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  lib/oesdk/package-sdks |    6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks index 
> > d6b01f7..9bfd887 100644
> > --- a/lib/oesdk/package-sdks
> > +++ b/lib/oesdk/package-sdks
> > @@ -109,7 +109,7 @@ create_sd_card_content() {
> >      cd $start_here_root
> >  
> >      # Copy the installer
> > -    cp $DEPLOY_ROOT/$m/$BUILD_ID/ti-sdk-$m* $start_here_root/
> > +    cp $DEPLOY_ROOT/$m/$BUILD_ID/${INSTALLER_PREFIX}-$m* 
> > + $start_here_root/
> >  
> >      if [ "$?" != "0" ]
> >      then
> > @@ -184,7 +184,7 @@ create_sdk_installer() {
> >  
> >      $INSTALL_BUILDER/builder build $INSTALL_BUILDER_PROJECT linux --setvars \
> >          sdk_loc="$installer_root/" \
> > -        sdk_name_prefix="ti-sdk"                  \
> > +        sdk_name_prefix="${INSTALLER_PREFIX}"                  \
> >          sdk_tar_name=$sdk_tar                     \
> >          output_dir="$deploy_root"                 \
> >          platform="$m"                             \
> > @@ -277,7 +277,7 @@ package_web_content() {
> >      fi
> >  
> >      # Move the installer into the exports directory
> > -    mv $deploy_root/ti-sdk-$m* $exports_root/
> > +    mv $deploy_root/${INSTALLER_PREFIX}-$m* $exports_root/
> >  
> >      # Create the md5sum file
> >      cd $exports_root
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

