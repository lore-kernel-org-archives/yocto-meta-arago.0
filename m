Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6DF5C52A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 14:30:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CEUiP5001753
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:30:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CEUh7C005428
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:30:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 09:30:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CEUhq1004986;
	Thu, 12 Mar 2015 09:30:43 -0500
Date: Thu, 12 Mar 2015 10:30:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20150312143042.GI24885@edge>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
	<1426164957-22030-5-git-send-email-j-stiffler@ti.com>
	<20150312135639.GC24885@edge>
	<4B26FB5A64EBA14C87266869E037F95814107DDB@DFLE09.ent.ti.com>
	<20150312142004.GF24885@edge>
	<4B26FB5A64EBA14C87266869E037F95814107E3E@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814107E3E@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/4] branding-processor-sdk: Add processor-sdk brand.
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
X-List-Received-Date: Thu, 12 Mar 2015 14:30:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 12, 2015 at 10:25:43AM -0400, Stiffler, Jacob wrote:
> I've been testing the patches since submitting the patches (wanted to get 
> these comments as soon as I could). It seems that this oe_filter_out method 
> is not working as expected...

Try using := when doing filter_out()...


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, March 12, 2015 10:20 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 4/4] branding-processor-sdk: Add processor-sdk brand.
> 
> On Thu, Mar 12, 2015 at 10:00:35AM -0400, Stiffler, Jacob wrote:
> > What would you suggest? That wayland be controlled as a feature from 
> > each branding file? Or a new variable introduced that arago.conf can 
> > check to decide if wayland should be added to the DISTRO_FEATURES?
> 
> Leave it like that for now - we'll see if we get any problems...
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, March 12, 2015 9:57 AM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 4/4] branding-processor-sdk: Add processor-sdk brand.
> > 
> > On Thu, Mar 12, 2015 at 08:55:57AM -0400, Jacob Stiffler wrote:
> > > * Set ARAGO_TISDK_IMAGE to "processor-sdk-linux-image"
> > > * For now, use sitara-linux-ti-staging
> > > * and remove wayland feature for ti33x and ti43x soc families.
> > > 
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644
> > > meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > > 
> > > diff --git
> > > a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > > b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > > new file mode 100644
> > > index 0000000..5eab952
> > > --- /dev/null
> > > +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.i
> > > +++ nc
> > > @@ -0,0 +1,35 @@
> > > +ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
> > > +
> > > +# Remove wayland from ti33x and ti43x DISTRO_FEATURES.
> > > +DIRSTO_FEATURES_ti33x = "${@oe_filter_out('DISTRO_FEATURES', 'wayland', d)}"
> > > +DIRSTO_FEATURES_ti43x = "${@oe_filter_out('DISTRO_FEATURES', 'wayland', d)}"
> > 
> > Usually you want immediate assignment here. But I have my doubts it will 
> > work reliably either way, when done like that...
> > 
> > 
> > > +PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "sitara-linux-ti-staging"
> > > +PREFERRED_PROVIDER_virtual/kernel_am437x-evm = "sitara-linux-ti-staging"
> > > +PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
> > > +
> > > +# To create newlines in the message \n is used and the slash must 
> > > +be escaped # to function properly
> > > +
> > > +SRCIPK_GIT_COMMIT_MESSAGE = "\
> > > +Create local branch\\n\
> > > +\\n\
> > > +The below commit is used for this local branch and is the one used 
> > > +by\\n\ this sdk:\\n\ ${SRCREV}."
> > > +
> > > +SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE 
> > > +="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
> > > +To reduce the size of the SDK installer only a portion of the git 
> > > +commit\\n\ history has been preserved. Also links to remote 
> > > +branches and tags do\\n\ not exist in this copy of the 
> > > +repository.\\n\ To fix this please run the 
> > > +unshallow-repositories.sh\\n\ script located in the sdk\'s bin 
> > > +directory\\n\ \\n\ The script may take several minutes but you will 
> > > +then have a full copy of\\n\ the git repository including its 
> > > +entire git history.\\n"
> > > +
> > > +SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging = "processor-sdk-1.0"
> > > +SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
> > > +
> > > +SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-1.0"
> > > +SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
> > > --
> > > 1.7.9.5
> > > 
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

