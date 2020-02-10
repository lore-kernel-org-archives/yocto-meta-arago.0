Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 157BF529B5
	for <meta-arago@arago-project.org>;
	Mon, 10 Feb 2020 13:03:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AD1duN109439
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 07:01:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581339699;
	bh=UwnHBFwS5V4CCRX2mkNOpHo7CwayilErKV+SKCU1yg8=;
	h=From:To:CC:Subject:Date;
	b=xSfKiLCB3tw5OzXNAMxujJRZAlIGKdXuAOCy6mJa3mf7zO8lTWMpihpH8vo7w7WE3
	DSL+KPYtqsEn4rq40qsCNSFCicmB9esyGixjbkZsH5PgSI+xrE67pv9ieUqSCJ26WM
	QPpMLtSeBIWK0FhBETjfFseUdpztUrGhHBzsSlsg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01AD1dGH126780
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 07:01:39 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 10 Feb 2020 07:01:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 10 Feb 2020 07:01:39 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AD1dB1045905;
	Mon, 10 Feb 2020 07:01:39 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1j18h0-00084i-PC; Mon, 10 Feb 2020 08:01:38 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Feb 2020 08:01:35 -0500
Message-ID: <1581339695-31008-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/zeus/thud][PATCH] docker: install init script if sysvinit
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
X-List-Received-Date: Mon, 10 Feb 2020 13:03:35 -0000
Content-Type: text/plain

The docker recipe in meta-virtualization has conflicting logic for
when to install and when to enable the docker initscript. When both
systemd and sysvinit are in DISTRO_FEATURES, this causes the docker
postinst to fail, which now fails the rootfs task.

Here we install the initscript only based on if sysvinit is in the
DISTRO_FEATURES.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-containers/docker/docker_git.bbappend | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/recipes-containers/docker/docker_git.bbappend

diff --git a/meta-arago-distro/recipes-containers/docker/docker_git.bbappend b/meta-arago-distro/recipes-containers/docker/docker_git.bbappend
new file mode 100644
index 0000000..dbb7b04
--- /dev/null
+++ b/meta-arago-distro/recipes-containers/docker/docker_git.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".tisdk0"
+
+do_install_append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
+	fi
+}
-- 
1.9.1


