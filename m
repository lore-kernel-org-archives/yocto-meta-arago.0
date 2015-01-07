Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9A648529E0
	for <meta-arago@arago-project.org>;
	Wed,  7 Jan 2015 18:12:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t07ICWYq015833
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 12:12:32 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07ICWa1005022
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 12:12:32 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 12:12:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07ICWEG030935;
	Wed, 7 Jan 2015 12:12:32 -0600
Date: Wed, 7 Jan 2015 13:12:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>
Message-ID: <20150107181231.GC4759@edge>
References: <1420556002-20165-1-git-send-email-j-stiffler@ti.com>
	<20150106181856.GY4759@edge> <54ACA814.7040105@ti.com>
	<4B26FB5A64EBA14C87266869E037F958140D1B9A@DFLE09.ent.ti.com>
	<24B88602B5904F49971CAF899152529B34B91375@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <24B88602B5904F49971CAF899152529B34B91375@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-tisdk-multimedia: Remove dspdce-fw from dra7xx-evm.
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
X-List-Received-Date: Wed, 07 Jan 2015 18:12:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 07, 2015 at 07:31:41AM -0500, R, Karthik wrote:
> Jake,
> 
> ACK for this patch.
> 
> Ok. I understand. 
> 
> But then we would need the specific SDKs to add either add the "opencl" or 
> "dspdce-fw" into the respective packagegroups as per their need.

> I just confirmed that the arago-glsdk-multimedia-image includes the 
> dspdce-fw explicity.

What do you mean includes it explicitly?

So, this comes back to the original suggestion to include either of the 2 FW 
images conditionally - do you mean to handle this by SDK branding?

-- 
Denys


> -----Original Message-----
> From: Stiffler, Jacob 
> Sent: Wednesday, January 07, 2015 5:46 PM
> To: R, Karthik
> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] packagegroup-arago-tisdk-multimedia: Remove dspdce-fw from dra7xx-evm.
> 
> Karthik,
> 
> Both "opencl" and "dspdce-fw" supply DSP firmware (i.e. "/lib/firmware/dra7-dsp1-fw.xe66").
> 
> Does MM use the DSP on dra7xx-evm? We have not seen any issues in our testing.
> 
> Thanks,
> Jake
> 
> -----Original Message-----
> From: R, Karthik
> Sent: Tuesday, January 06, 2015 10:29 PM
> To: Stiffler, Jacob
> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-multimedia: Remove dspdce-fw from dra7xx-evm.
> 
> Jake,
> 
> 
> On 06-Jan-15 11:48 PM, Denys Dmytriyenko wrote:
> > So, this will break MM for dra7xx-evm, but we still don't have OpenCL 
> > enabled by default. Should this be more conditional, if both of those can't co-exist?
> 
> >
> >
> > On Tue, Jan 06, 2015 at 09:53:22AM -0500, Jacob Stiffler wrote:
> >> * This is to avoid conflict with OpenCL firmware.
> >>
> 
> Could you please give more details about the conflict with OpenCL firmware?
> 
> Regards
> Karthik
> 
> >> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >> ---
> >>   .../packagegroup-arago-tisdk-multimedia.bb         |    3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git
> >> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis
> >> dk-multimedia.bb
> >> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis
> >> dk-multimedia.bb
> >> index 81d5ee1..c51a02c 100644
> >> ---
> >> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis
> >> dk-multimedia.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago
> >> +++ -tisdk-multimedia.bb
> >> @@ -1,6 +1,6 @@
> >>   DESCRIPTION = "Task to add multimedia related packages"
> >>   LICENSE = "MIT"
> >> -PR = "r10"
> >> +PR = "r11"
> >>
> >>   inherit packagegroup
> >>
> >> @@ -49,7 +49,6 @@ ACCEL_FW_append_omap5-evm = " \
> >>
> >>   ACCEL_FW_append_dra7xx-evm = " \
> >>       ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
> >> -    dspdce-fw \
> >>       vis \
> >>       "
> >>
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> 

