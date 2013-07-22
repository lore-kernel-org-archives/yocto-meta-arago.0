Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9498952972
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2013 16:24:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6MGONoE004870
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2013 11:24:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6MGONA6030557
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2013 11:24:23 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Jul 2013 11:24:23 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6MGONHM010261;
	Mon, 22 Jul 2013 11:24:23 -0500
Date: Mon, 22 Jul 2013 12:24:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130722162422.GC30374@edge>
References: <CF956B779D819D41BBC043B7082161D543FB18@DBDE04.ent.ti.com>
	<F4FA69BF-19EF-4E05-BF7E-27D51BBD6B38@ti.com> <51ECB170.300@ti.com>
	<CA454FEB-4832-45BC-B0CF-982F31CB4F78@ti.com>
MIME-Version: 1.0
In-Reply-To: <CA454FEB-4832-45BC-B0CF-982F31CB4F78@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Mon, 22 Jul 2013 16:24:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 22, 2013 at 12:12:23PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> On Jul 21, 2013, at 11:13 PM, "Heroor, Siddharth" <heroor@ti.com> wrote:
> 
> > On 7/12/2013 6:41 PM, Cooper Jr., Franklin wrote:
> >> 
> >> 
> >> On Jul 12, 2013, at 1:43 AM, "Hingolikar, Mrinmayee" <mrinmayee@ti.com> wrote:
> >> 
> >>> 
> >>> * The OMAP5 Audio Backend requires a 'firmware' to enable
> >>> sound. This recipe installs a prebuilt firmware. This
> >>> part is a hack, as in the current form, the firmware
> >>> cannot be cross-compiled. There is a plan to fix this
> >>> and hopefully, this recipe is short-lived. Once the code
> >>> is fixed, we should have new recipes that build the firmware
> >>> and clean up this recipe.
> >>> 
> >>> v2:
> >>> * Merged contents from abefw.inc and removed abefw.inc based
> >>> on review.
> >>> 
> >>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >>> ---
> >>> recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
> >>> 1 files changed, 20 insertions(+), 0 deletions(-)  create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb
> >>> 
> >>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
> >>> new file mode 100644
> >>> index 0000000..8db71e4
> >>> --- /dev/null
> >>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> >>> @@ -0,0 +1,20 @@
> >>> +SUMMARY = "Firmware for OMAP5 ABE"
> >>> +HOMEPAGE = "http://git.ti.com"
> >>> +LICENSE = "BSD/GPLv2"
> >> I'm assuming this means BSD or GPLv2.
> >> 
> >> The proper syntax is
> >> LICENSE = "BSD | GPLv2"

Ack on this comment - please use the correct syntax for the LICENSE field, as 
it has changed since Classic OE and is no longer a free form.


> >>> +LIC_FILES_CHKSUM = "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
> >>> +
> >>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> I don't see any machine based overrides or appends in this recipe. This isn't needed. 
> >> 
> >>> +COMPATIBLE_MACHINE = "omap5-evm"

> >> I'm just curious if the dra7xx or any other possible future boards will 
> >> be using this firmware/recipe. If so any harm in making this generic and 
> >> specifying omap-a15?
> > 
> > This is an IP *specific* to OMAP4/5. On OMAP5, the ABE (Audio Backend)
> > is present to allow for low power audio playback. Refer TRM
> > (http://www.ti.com/lit/ug/swpu249w/swpu249w.pdf) section 13. - Audio
> > Subsystem.
> > 
> > On DRA7xx ABE isn't present. Instead we have multiple McASPs (upto 8)
> > for which no firmware is required. McASP has its own sound driver (which
> > should be common to other devices).
> > 
> > By setting COMPATIBILITY and PACKAGE_ARCH to be limited to omap5, we
> > make it obvious that the IP is OMAP5 specific and not generic for all
> > omap-a15 devices.

> For COMPATIBILITY that's fine since it will prevent any other board from 
> building the recipe but PACKAGE_ARCH still isn't needed so it should be 
> removed.

Well, unless you have common feeds and want to prevent the package to be 
accidentally installed on dra7xx... But I'd like to hear if Sid's team is 
planning to offer feeds. Either way PACKAGE_ARCH is good to have in this case.

-- 
Denys

