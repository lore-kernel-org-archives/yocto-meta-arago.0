Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6AAD7788C
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:03:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147.1769187822668821532
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 09:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19FB840CC4;
	Fri, 23 Jan 2026 17:03:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEoPSQquKfKD; Fri, 23 Jan 2026 17:03:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9643D40C2E;
	Fri, 23 Jan 2026 17:03:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4EAB6177D8C; Fri, 23 Jan 2026 12:03:33 -0500 (EST)
Date: Fri, 23 Jan 2026 12:03:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-arago@lists.yoctoproject.org,
	praneeth@ti.com, v-singh1@ti.com, c-shilwant@ti.com, khasim@ti.com,
	afd@ti.com, devarsht@ti.com
Subject: Re: [meta-arago] [scarthgap][RFC PATCH 1/3] recipes-multimedia:
 Add pipewire configuration files
Message-ID: <20260123170333.GD11121@denix.org>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-2-p-bhagat@ti.com>
 <da8a1b60-525e-45c7-afce-7af747dd1af8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da8a1b60-525e-45c7-afce-7af747dd1af8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 17:03:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17032

On Fri, Jan 23, 2026 at 10:03:39AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 1/23/2026 12:03 AM, Paresh Bhagat wrote:
> >- Add 92-capture.conf for capture configuration
> >- Add 90-multichannel.conf for multichannel setup
> >- Add pipewire_1.0.9.bbappend recipe extension
> >
> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  .../pipewire/pipewire/90-multichannel.conf      | 17 +++++++++++++++++
> >  .../pipewire/pipewire/92-capture.conf           | 17 +++++++++++++++++
> >  .../pipewire/pipewire_1.0.9.bbappend            | 14 ++++++++++++++
> >  3 files changed, 48 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf
> >  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf
> >  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf
> >new file mode 100644
> >index 00000000..1dd926bc
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-multichannel.conf
> >@@ -0,0 +1,17 @@
> >+context.objects = [
> >+    {
> >+        factory = adapter
> >+        args = {
> >+            factory.name     = api.alsa.pcm.sink
> >+            node.name        = "alsa_multidac_8ch"
> >+            node.description = "Multi-DAC 8ch Output"
> >+            media.class      = "Audio/Sink"
> >+
> >+            api.alsa.path = "hw:0,0"
> >+            api.alsa.disable-mmap = true
> >+
> >+            audio.channels = 8
> >+            audio.position = [ FL FR FC LFE RL RR SL SR ]
> >+        }
> >+    }
> >+]
> >diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf
> >new file mode 100644
> >index 00000000..b0871da2
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/92-capture.conf
> >@@ -0,0 +1,17 @@
> >+context.objects = [
> >+    {
> >+        factory = adapter
> >+        args = {
> >+            factory.name     = api.alsa.pcm.source
> >+            node.name        = "alsa_multidac_4ch_capture"
> >+            node.description = "ALSA 4ch Capture (L1 L2 R1 R2)"
> >+            media.class      = Audio/Source
> >+
> >+            api.alsa.path = "hw:0,0"
> >+            api.alsa.disable-mmap = true
> >+
> >+            audio.channels = 4
> >+            audio.position = [ FL FR SL SR ]
> >+        }
> >+    }
> >+]
> >diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend
> >new file mode 100644
> >index 00000000..29b17af3
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_1.0.9.bbappend
> 
> 
> We do not directly bbappend recipes to maintain yoctoproject
> compatible status.  Please check other bbappends in meta-arago for
> examples on how to do this properly.  For example:
> meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
> 
> 
> This same comment applies to the other patches where you add
> bbappend files as well.

And since this is to add 2 extra conf files, alternatively this could be a 
completely separate recipe.


> >@@ -0,0 +1,14 @@
> >+SRC_URI += " \
> >+    file://90-multichannel.conf \
> >+    file://92-capture.conf \
> >+"
> >+
> >+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >+
> >+do_install:append() {
> >+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> >+    install -m 0644 ${WORKDIR}/90-multichannel.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> >+    install -m 0644 ${WORKDIR}/92-capture.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> >+}
> >+
> >+FILES:${PN} += " ${sysconfdir}"

