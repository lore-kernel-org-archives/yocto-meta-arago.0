Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33b.ess.de.barracuda.com
	(egress-ip33b.ess.de.barracuda.com [18.185.115.237])
	by arago-project.org (Postfix) with ESMTPS id 9EE9952A67
	for <meta-arago@arago-project.org>;
	Tue,  7 Sep 2021 10:26:28 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
	[209.85.210.198]) by
	mx-outbound23-168.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 07 Sep 2021 10:26:56 +0000
Received: by mail-pf1-f198.google.com with SMTP id
	k76-20020a62844f000000b00415e244e9b1so3310579pfd.17
	for <meta-arago@arago-project.org>;
	Tue, 07 Sep 2021 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TMpCJalI3YbNxroh/ULSui35iOMjY9mYxTXtcWzrg0c=;
	b=VFuaHQJq9tg6YTReiOj3JuaF65H9JGAdgzGuOMJD53A9n7VMQqXfHWbWeEUcGvWWib
	UxkKMt9sDDgaxMRnrez77HkzTBssm6N7NRzn2kehMXIX5uh9KHU8DOVqksPOaSKpnc/V
	NHUGibadDs3hAIfmrLUjldfW5XIDkRKQt4Azk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TMpCJalI3YbNxroh/ULSui35iOMjY9mYxTXtcWzrg0c=;
	b=htuFCcXkyfX/U2HsfirrnJEYBkGAjzUzS5JYoDc0cvIIRSOpsDDDqFaGaNufm/+K+x
	DLy/wmYaxDCt9001SqqMexWlTeRfUeKjUc9ZmdFkUGlGIsrE1NOP0qflrqOFFvmLlY8G
	sMxnnOB14iNPhBS4ubHLzddmOS/qRzSV3h/DRTtTeoOy2geYUcgNRuvLkiRJCD6Kxfud
	ZnQaQgK4aOil1d65C81j4SKkS3Avtatvt5yYp1XcE0+F90gSzsfoLUE9XowGnmJCLeUR
	BmOMU0tX15Wes4pV2U3TRMmMT98RA2QuDbWMODk3JO9YGemiUXGAqjnByHXL9dehkRkX
	wnTQ==
X-Gm-Message-State: AOAM5336eXJrEneEeNh4fuBXw6Ix0ZugMppWz0gZRHGzeZ7CqCopOVd2
	d/O/0BLMeEonEt83MihT/455/SlLoMkbVSK/afAAO0QbIW6RuiaWegQFm3uPVwOrQJVki8mBI7H
	oMWCNGPPoTPnBz5imyg0kmnBtG3YvWZ5FSjjsWgqaeOCYbExZewZ2iErStdk1
X-Received: by 2002:a63:741b:: with SMTP id p27mr9379391pgc.140.1631010415679; 
	Tue, 07 Sep 2021 03:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmx5LeFIv9abuU5Tl4Z5EIBnptzwwj0N8Ww4kUUGsg4yI05WYQqfh41AdZ+UJkLW5808cLAw==
X-Received: by 2002:a63:741b:: with SMTP id p27mr9379355pgc.140.1631010415179; 
	Tue, 07 Sep 2021 03:26:55 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	m21sm1245241pfa.216.2021.09.07.03.26.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Sep 2021 03:26:54 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  7 Sep 2021 15:56:37 +0530
Message-Id: <20210907102637.81528-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1631010416-306056-5353-102-1
X-BESS-VER: 2019.1_20210902.1518
X-BESS-Apparent-Source-IP: 209.85.210.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.234308 [from 
	cloudscan23-90.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [oe-layersetup PATCH v4] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Tue, 07 Sep 2021 10:26:29 -0000
Content-Transfer-Encoding: 8bit

Add config file for processor-sdk 07.03.00.005 release

Signed-off-by: Priya N S <priya.ns@ti.com>
---

Hi All,

This patch adds the processor-sdk-07.03.00.005-config for the AM335x
and AM437x 07.03 release.

Changes made in the v4 patch:
* Updated the commit message with the description of the patch.

v3:
http://arago-project.org/pipermail/meta-arago/2021-August/013309.html

v2:
http://arago-project.org/pipermail/meta-arago/2021-August/013290.html

v1:
http://arago-project.org/pipermail/meta-arago/2021-August/013289.html

 .../processor-sdk-07.03.00.005-config.txt          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-07.03.00.005-config.txt

diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
new file mode 100644
index 0000000..548e759
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
2.19.1.windows.1


