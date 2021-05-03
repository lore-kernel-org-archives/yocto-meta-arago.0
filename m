Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 679CF52C88
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3016240C56;
	Mon,  3 May 2021 21:32:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MvG3zg3peTky; Mon,  3 May 2021 21:32:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F32040AB7;
	Mon,  3 May 2021 21:32:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 37DEA1745D3; Mon,  3 May 2021 17:32:51 -0400 (EDT)
Date: Mon, 3 May 2021 17:32:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <20210503213251.GE21867@denix.org>
References: <1616534107-46438-1-git-send-email-denis@denix.org>
	<20210503211256.GD21867@denix.org>
	<ee17cc62-5edd-d830-f109-6cb3179c791e@ti.com>
MIME-Version: 1.0
In-Reply-To: <ee17cc62-5edd-d830-f109-6cb3179c791e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH 1/4] chromium: apply bbappend with fix dynamically based on "browser-layer" presence
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
X-List-Received-Date: Mon, 03 May 2021 21:32:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 03, 2021 at 04:29:06PM -0500, Bajjuri, Praneeth wrote:
> 
> 
> On 5/3/2021 4:12 PM, Denys Dmytriyenko wrote:
> >Praneeth,
> >
> >Any plans to merge this series?
> >
> >Even though the config is disabled by default, it does some recipe cleanup and
> >establishes dynamic layer dependency framework.
> 
> Thanks for the bump, pulled to dunfell-next.
> 
> Will sync to -master in  a day once the nightly build is done.

Thanks! Might want to pull corresponding oe-layersetup patch as well, even 
though it only adds extra comments :)


> --Praneeth
> 
> >
> >
> >On Tue, Mar 23, 2021 at 05:15:04PM -0400, Denys Dmytriyenko wrote:
> >>From: Denys Dmytriyenko <denys@konsulko.com>
> >>
> >>This solves the dangling bbappend warning when browser-layer is not enabled.
> >>
> >>As chromium still requires Python2, corresponding meta-python2 layer is required.
> >>
> >>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >>---
> >>  meta-arago-distro/conf/layer.conf                                     | 4 ++++
> >>  .../chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch     | 0
> >>  .../recipes-browser/chromium/chromium-ozone-wayland_%.bbappend        | 0
> >>  3 files changed, 4 insertions(+)
> >>  rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch (100%)
> >>  rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend (100%)
> >>
> >>diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> >>index 2931bf9..9014511 100644
> >>--- a/meta-arago-distro/conf/layer.conf
> >>+++ b/meta-arago-distro/conf/layer.conf
> >>@@ -24,6 +24,10 @@ LAYERRECOMMENDS_meta-arago-distro = " \
> >>      browser-layer \
> >>  "
> >>+BBFILES_DYNAMIC += " \
> >>+    browser-layer:${LAYERDIR}/dynamic-layers/browser-layer/recipes*/*/*.bbappend \
> >>+"
> >>+
> >>  BB_DANGLINGAPPENDS_WARNONLY = "true"
> >>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> >>diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
> >>similarity index 100%
> >>rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
> >>rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
> >>diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> >>similarity index 100%
> >>rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> >>rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> >>-- 
> >>2.7.4
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>
> >
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

