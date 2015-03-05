Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4B3585297F
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:22:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25IMfZD025073
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:22:41 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IMeaP002604
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:22:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 12:22:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IMd5N031086;
	Thu, 5 Mar 2015 12:22:40 -0600
Date: Thu, 5 Mar 2015 13:22:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150305182239.GS6052@edge>
References: <1425571261-18353-1-git-send-email-j-stiffler@ti.com>
	<20150305174919.GP6052@edge>
	<4B26FB5A64EBA14C87266869E037F958141055EF@DFLE09.ent.ti.com>
	<9147477F-25C5-470D-AF33-1CE02154B95E@ti.com>
MIME-Version: 1.0
In-Reply-To: <9147477F-25C5-470D-AF33-1CE02154B95E@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-prefs: wpa-supplicant PREFERRED_PROVIDER to wpa-supplicant-wl18xx for omap-a15 family.
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
X-List-Received-Date: Thu, 05 Mar 2015 18:22:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 05, 2015 at 01:20:48PM -0500, Cooper Jr., Franklin wrote:
> 
> 
> 
> > On Mar 5, 2015, at 11:54 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> > 
> > I noticed this, but I wasn't sure if it would be better to do it this way, 
> > or specify both PREFERRED_PROVIDER_wpa-supplicant_dra7xx-evm and 
> > PREFERRED_PROVIDER_wpa-supplicant_am57xx-evm. I attempted to specify 
> > PREFERRED_PROVIDER_wpa-supplicant_dra7xx, but this was not working.

> This probably goes back to the issue with SOC families I had awhile ago.

Yeah, that rings a bell. I've never faced it myself, but I remember you 
mentioning it...


> Anyway at this point all the actively maintained devices are using wilink 8 
> so maybe we set that as the default and if someone really wants they can set 
> the old devices to wilink 6.

Sounds good to me.


> > -----Original Message-----
> > From: Dmytriyenko, Denys 
> > Sent: Thursday, March 05, 2015 12:49 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] arago-prefs: wpa-supplicant PREFERRED_PROVIDER to wpa-supplicant-wl18xx for omap-a15 family.
> > 
> >> On Thu, Mar 05, 2015 at 11:01:01AM -0500, Jacob Stiffler wrote:
> >> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >> ---
> >> .../conf/distro/include/arago-prefs.inc            |    2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc 
> >> b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> index e689f8b..c872d9a 100644
> >> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> @@ -119,7 +119,7 @@ PREFERRED_VERSION_m4 = "1.4.9"
> >> PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
> >> PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
> >> PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
> >> -PREFERRED_PROVIDER_wpa-supplicant_dra7xx-evm = "wpa-supplicant-wl18xx"
> >> +PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
> > 
> > I'm fine with this. Although, omap-a15 also includes OMAP5 EVM, but it's not enabled in bt-firmware nor connectivity packagegroup, which only enable dra7xx
> > 
> > 
> >> PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
> >> PREFERRED_PROVIDER_gstreamer-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
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

