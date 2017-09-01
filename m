Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 74D7052A05
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 18:11:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81IBdDd003342
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 13:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504289499;
	bh=HigKy1S05mZuuAWRYjmXYk/MYephtqGtlpTBkJFxqqs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bcyh2Db3saVrsBc4uCqzuV4LdXzgguEZaFBV5+tEniuFvKWwnvr3xsXPD2Atse9Zj
	+ZPzn6j31y5xsr3S431vaAg+BUhHZf529IFs2VI7z7qeXLqtrIQ4SywKSYhSjnhghK
	ZAcE3g03kOuqd4i7799YqYoyK3272gci+XxCF4kE=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81IBdbL002137
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 13:11:39 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Fri, 1 Sep 2017 13:11:38 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][matrix-gui-v2-apps][PATCH v1] hmi_apps :
	hmi_protection_relays : new demo
Thread-Index: AQHTIdSc0GxOdB/VYUuqvlxxUZgL76KgV2gg
Importance: high
X-Priority: 1
Date: Fri, 1 Sep 2017 18:11:38 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EC3B173@DFLE12.ent.ti.com>
References: <20170830211154.13489-1-manisha.agrawal@ti.com>
In-Reply-To: <20170830211154.13489-1-manisha.agrawal@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [matrix-gui-v2-apps][PATCH v1] hmi_apps : hmi_protection_relays : new demo
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
X-List-Received-Date: Fri, 01 Sep 2017 18:11:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am still waiting for feedback on this one. I need commit id from this che=
ck to push my other patches on another new demo.=20


Regards,
Manisha


-----Original Message-----
From: Agrawal, Manisha=20
Sent: Wednesday, August 30, 2017 4:12 PM
To: meta-arago@arago-project.org
Cc: Dmytriyenko, Denys; Stiffler, Jacob; Agrawal, Manisha
Subject: [meta-arago][matrix-gui-v2-apps][PATCH v1] hmi_apps : hmi_protecti=
on_relays : new demo

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../hmi_protection_relays/desc_hmi_protection_relays.html    |  9 ++++++++=
+
 hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop | 12 ++++++++=
++++
 hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh     | 12 ++++++++=
++++
 3 files changed, 33 insertions(+)
 create mode 100644 hmi_apps/hmi_protection_relays/desc_hmi_protection_rela=
ys.html
 create mode 100644 hmi_apps/hmi_protection_relays/hmi_protection_relays.de=
sktop
 create mode 100755 hmi_apps/hmi_protection_relays/runHmiProtectionRelays.s=
h

diff --git a/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html=
 b/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
new file mode 100644
index 0000000..b8e4264
--- /dev/null
+++ b/hmi_apps/hmi_protection_relays/desc_hmi_protection_relays.html
@@ -0,0 +1,9 @@
+<h1> Protection Relays HMI Example </h1>
+
+<p> This example demonstrates HMI for Protection Relays application. QT QW=
idget tool is used to draw the screen.
+
+<br>
+
+
+</p>
+
diff --git a/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop b=
/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
new file mode 100644
index 0000000..384431b
--- /dev/null
+++ b/hmi_apps/hmi_protection_relays/hmi_protection_relays.desktop
@@ -0,0 +1,12 @@
+#!/usr/bin/env xdg-open
+
+[Desktop Entry]
+Name=3DPROTECTION_RELAYS
+GenericName=3DDemo App
+Icon=3D/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
+Exec=3D/usr/bin/runHmiProtectionRelays.sh
+Type=3DApplication
+ProgramType=3Dgui
+Categories=3Dhmi
+X-MATRIX-Lock=3Dhmi_protection_relays_lock
+X-MATRIX-Description=3D/usr/share/matrix-gui-2.0/apps/hmi_protection_relay=
s/desc_hmi_protection_relays.html
diff --git a/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh b/hmi=
_apps/hmi_protection_relays/runHmiProtectionRelays.sh
new file mode 100755
index 0000000..3d85999
--- /dev/null
+++ b/hmi_apps/hmi_protection_relays/runHmiProtectionRelays.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+
+/etc/init.d/weston stop
+sleep 1
+echo 0 > /sys/class/graphics/fbcon/cursor_blink
+
+protection_relays_hmi -platform linuxfb
+
+echo 1 > /sys/class/graphics/fbcon/cursor_blink
+
+/etc/init.d/weston start
+sleep 1
--=20
2.13.0


