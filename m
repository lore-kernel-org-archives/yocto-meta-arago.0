Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 434D952A29
	for <meta-arago@arago-project.org>;
	Thu,  2 Apr 2015 17:29:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t32HT32w014136
	for <meta-arago@arago-project.org>; Thu, 2 Apr 2015 12:29:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t32HT143009817
	for <meta-arago@arago-project.org>; Thu, 2 Apr 2015 12:29:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 2 Apr 2015 12:29:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t32HT13M010026;
	Thu, 2 Apr 2015 12:29:01 -0500
Date: Thu, 2 Apr 2015 13:29:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20150402172901.GW21023@edge>
References: <1426791202-23545-1-git-send-email-j-stiffler@ti.com>
	<20150320233926.GR11557@edge>
	<4B26FB5A64EBA14C87266869E037F95814110789@DFLE09.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F9581411C4DD@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581411C4DD@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sdk-install: Modify create-sdcard with user-supplied installation directory.
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
X-List-Received-Date: Thu, 02 Apr 2015 17:29:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Core SDK was finally out last night (yeah, April 1st...) so I can push the 
pending patches again.


On Wed, Apr 01, 2015 at 06:39:52AM -0400, Stiffler, Jacob wrote:
> Ping.
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Monday, March 23, 2015 6:23 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] sdk-install: Modify create-sdcard with user-supplied installation directory.
> 
> This is fine on its own. This is intended to work with the current version of create-sdcard.sh used in the SDKs.
> 
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, March 20, 2015 7:39 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] sdk-install: Modify create-sdcard with user-supplied installation directory.
> 
> Does this require a corresponding change to create-sdcard.sh in setup scripts? 
> Or should it go on its own?
> 
> 
> On Thu, Mar 19, 2015 at 02:53:22PM -0400, Jacob Stiffler wrote:
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../tisdk-install/tisdk-install/sdk-install.sh     |    6 ++++++
> >  .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> > all.sh
> > b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> > all.sh
> > index cf90089..65c5b69 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-inst
> > all.sh
> > +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-
> > +++ install.sh
> > @@ -102,6 +102,12 @@ then
> >      sed -i -e s=__SDK_INSTALL_DIR__=$install_dir=
> > $install_dir/bin/unshallow-repositories.sh
> >  fi
> >  
> > +# Modify create-sdcard.sh to have user-supplied installation 
> > +directory if [ -f "${install_dir}/bin/create-sdcard.sh" ] then
> > +    sed -i -e "s|ti-sdk.*\[0-9\]|${install_dir##*/}|g" 
> > +${install_dir}/bin/create-sdcard.sh
> > +fi
> > +
> >  # Update CCS project files using important paths to headers
> >  
> >  find $install_dir/example-applications -type f -exec sed -i 
> > "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} 
> > \; diff --git 
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> > b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> > index 83efd61..a3b88d9 100644
> > ---
> > a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.
> > +++ bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
> > "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
> >  
> >  SRC_URI = "file://sdk-install.sh"
> >  
> > -PR = "r4"
> > +PR = "r5"
> >  
> >  do_install () {
> >      install -d ${D}/
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

