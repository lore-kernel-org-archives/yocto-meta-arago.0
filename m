Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 14A2E52A83
	for <meta-arago@arago-project.org>;
	Wed, 18 May 2016 18:06:58 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7D00JYFWZ67J70@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 18 May 2016 13:06:42 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=-dNhQyHuMfHJtBM-0yAA:9
Received: by 100.15.86.14 with SMTP id 3d8b9a86; Wed, 18 May 2016 18:06:42 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 03F2E16200B;	Wed,
	18 May 2016 14:06:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 18 May 2016 14:06:41 -0400
Message-id: <1463594801-29707-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] alsa-plugins: don't make pulseaudio the default device when available
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
X-List-Received-Date: Wed, 18 May 2016 18:06:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Still want just plain ALSA even when pulseaudio is available.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/alsa/alsa-plugins_%.bbappend          | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend b/meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend
new file mode 100644
index 0000000..7e98c00
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/alsa/alsa-plugins_%.bbappend
@@ -0,0 +1,12 @@
+PR_append = ".arago0"
+
+do_install_append() {
+	# We don't want pulse to be the default audio device, even when installed
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
+		mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example || true
+	fi
+}
+
+FILES_${PN}-pulseaudio-conf += "\
+	${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example \
+"
-- 
2.2.0


