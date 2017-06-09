Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EC246529E8
	for <meta-arago@arago-project.org>;
	Fri,  9 Jun 2017 21:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB3DD20C0E;
	Fri,  9 Jun 2017 21:46:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QrSaL3aVgzZu; Fri,  9 Jun 2017 21:46:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C811C20C0A;
	Fri,  9 Jun 2017 21:46:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 562B71624E9;
	Fri,  9 Jun 2017 17:46:35 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  9 Jun 2017 17:46:34 -0400
Message-Id: <1497044794-24189-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497044794-24189-1-git-send-email-denys@ti.com>
References: <1497044794-24189-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] uboot-config: check UBOOT_CONFIG variable, not flags, for error conditions
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
X-List-Received-Date: Fri, 09 Jun 2017 21:46:38 -0000

Sometimes there's a need to change existing UBOOT_CONFIG setting from a recipe,
distro or local config, such as an override or even switch back to UBOOT_MACHINE.
Unfortunately, there's no easy way to override or unset flags, so using them as
an error condition is rather heavy-handed. Change those conditions to check the
UBOOT_CONFIG variable itself, not its flags.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/uboot-config.bbclass | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/classes/uboot-config.bbclass b/meta-arago-distro/classes/uboot-config.bbclass
index 3f760f2..7117701 100644
--- a/meta-arago-distro/classes/uboot-config.bbclass
+++ b/meta-arago-distro/classes/uboot-config.bbclass
@@ -20,24 +20,21 @@ python () {
     ubootbinaries = d.getVar('UBOOT_BINARIES', True)
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
+    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
 
-    if not ubootmachine and not ubootconfigflags:
+    if not ubootmachine and len(ubootconfig) == 0:
         PN = d.getVar("PN", True)
         FILE = os.path.basename(d.getVar("FILE", True))
         bb.debug(1, "To build %s, see %s for instructions on \
                  setting up your machine config" % (PN, FILE))
         raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE", True))
 
-    if ubootmachine and ubootconfigflags:
+    if ubootmachine and len(ubootconfig) > 0:
         raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
 
     if ubootconfigflags and ubootbinaries:
         raise bb.parse.SkipPackage("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
 
-    if not ubootconfigflags:
-        return
-
-    ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
     if len(ubootconfig) > 0:
         for config in ubootconfig:
             for f, v in ubootconfigflags.items():
@@ -57,6 +54,4 @@ python () {
                         bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
                         d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
                     break
-    elif len(ubootconfig) == 0:
-       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
 }
-- 
2.7.4


