Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 045C4529A2
	for <meta-arago@arago-project.org>;
	Tue, 13 Apr 2021 15:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 355DA40C53;
	Tue, 13 Apr 2021 15:46:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qMmK2dMnscZb; Tue, 13 Apr 2021 15:46:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EFEF8407E5;
	Tue, 13 Apr 2021 15:46:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CAEAE1745AC; Tue, 13 Apr 2021 11:46:45 -0400 (EDT)
Date: Tue, 13 Apr 2021 11:46:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Suman Anna <s-anna@ti.com>
Message-ID: <20210413154645.GM15937@denix.org>
References: <20210412034540.18980-1-praneeth@ti.com>
	<20210412035855.GJ15937@denix.org>
	<edb7035e-fa10-dc3d-eccd-b6321ea6d451@ti.com>
	<242721a0-8ddc-64e6-aad7-ed94be4ad0ce@ti.com>
MIME-Version: 1.0
In-Reply-To: <242721a0-8ddc-64e6-aad7-ed94be4ad0ce@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master PATCH] branding-core: Remove PREFERRED_VERSION to pick 2021LTS baseline
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
X-List-Received-Date: Tue, 13 Apr 2021 15:46:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 13, 2021 at 10:22:21AM -0500, Suman Anna wrote:
> On 4/13/21 10:19 AM, Suman Anna wrote:
> > On 4/11/21 10:58 PM, Denys Dmytriyenko wrote:
> >> On Sun, Apr 11, 2021 at 10:45:40PM -0500, praneeth@ti.com wrote:
> >>> From: Praneeth Bajjuri <praneeth@ti.com>
> >>>
> >>> commit 400d58becfb5 ("branding: Add branding-core-next to aid in migration")
> >>> added support of PREFERRED_VERSION as 2020LTS kernel and uboot for branding core.
> >>>
> >>> Now that migration to 2021LTS (i.e 5.10 kernel and 2021.01 u-boot) is added,
> >>> removing the PREFERRED_VERSION so that core brand picks the expected
> >>> kernel and uboot baseline.
> >>
> >> I assume everything has been ported to 5.10, including ipc/rpmsg, SGX/RGX, 
> > 
> > IPC 3.x stack and K2 MPM and dependent components will break, since I haven't
> > added the rpmsg-proto and rpmsg-rpc drivers yet (legacy SoCs).

Any ETA on this?


> > SGX/RGX kernel dts nodes are added, and Gowtham is working through the driver
> > changes to get them functional.
> 
> Ignore the graphics comment, I see pending meta-ti patches for the same posted
> yday.

Yeah, saw those, thanks for the update.


> regards
> Suman
> 
> > 
> > regards
> > Suman
> > 
> >> etc. and everything in CoreSDK builds w/o issues in Dunfell?
> >>
> >>
> >> Probably best to completely remove core-next branding, i.e. reverting:
> >> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=f90d1bed7e775ac59bf1fcd95e95e9109d0953db
> >> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=400d58becfb53a62d9cc9ad75ddfcd0933e426f5
> >>
> >> Also, revert this in meta-ti:
> >> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=a0e26c1caf7d36953bd41f6a763101f5a65919e2
> >>
> >> And when updating the kernel, don't forget to re-add the minor version:
> >> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=efa402ee13689e61b4a5758334e71aae302310c3
> >>
> >>
> >>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> >>> ---
> >>>  meta-arago-distro/conf/distro/include/branding-core.inc | 5 -----
> >>>  1 file changed, 5 deletions(-)
> >>>
> >>> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> >>> index 10853d8b..3d259d2d 100644
> >>> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> >>> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> >>> @@ -12,10 +12,5 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
> >>>  # Raise priority for sample IPC FW images
> >>>  ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
> >>>  
> >>> -PREFERRED_VERSION_linux-ti-staging = "5.4%"
> >>> -PREFERRED_VERSION_linux-ti-staging-rt = "5.4%"
> >>> -PREFERRED_VERSION_linux-ti-staging-systest = "5.4%"
> >>> -PREFERRED_VERSION_u-boot-ti-staging = "2020.01%"
> >>> -
> >>>  # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
> >>>  MACHINE_FEATURES_remove = "mmip"
> >>> -- 
> >>> 2.17.1
> >>>
> >>> _______________________________________________
> >>> meta-arago mailing list
> >>> meta-arago@arago-project.org
> >>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>>
> >>
> > 
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

