Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 51E6B529F8
	for <meta-arago@arago-project.org>;
	Thu, 26 Aug 2021 10:31:49 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
	[209.85.214.198]) by
	mx-outbound46-47.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 26 Aug 2021 10:32:13 +0000
Received: by mail-pl1-f198.google.com with SMTP id
	s3-20020a1709029883b029012b41197000so859636plp.16
	for <meta-arago@arago-project.org>;
	Thu, 26 Aug 2021 03:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kdMYSf8Ovv5U92g4nM4DlywLyUEZ+zcq4HEoqRowARU=;
	b=LDTldyDjYjKjtr38a/FCrY8sxmb+ld/NvVzz7ORV0CNMbmPQQ+9AxJIQEydDFEIkIb
	H9SFqq6dbNcWbdkHqyX7f7q4NVDMGBs4Lio4HiCjrpbhEM/KawcdVJvunL6oPNxpzGRH
	2JvA7YWG29MCbaVN+mFT+syZUR3HrJ3MUEtR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kdMYSf8Ovv5U92g4nM4DlywLyUEZ+zcq4HEoqRowARU=;
	b=M7zEXHi+jdl6y0ZPVsQRNy2KQrg9t711ta1XCMd6WLGUp17dsKK+DvMFk2hnoGUHAc
	C0f3DI0cDocftXHMzGIpZhHw/W5/F6nuGVzjbGcpStIrlq84zNMr84k3cAdOWyWZ+RpY
	QfXOlMuAvnUFJbr1UeWwHpxiBgdM324CVtoZOpYbLZxB8OxP/5IAP4vE9MnHUz1xGWka
	1n4GGOjVpqstltdESq8WQmMq3WSV+mt/MHEoyoCibAJUxVBJbqmGDinsOn+Ope3Y49r+
	osZig14VHsdtq2VPn/WkI9JuYdaU/WkrNQHCmEvWbC8zvJw5o9j+ez+c73rpdO8ongM7
	S8pw==
X-Gm-Message-State: AOAM5322ourOanQGDdEs+0afw9yK262eJRPmxMnvv5dW5GKujtaqjbhj
	7SJ97fmAq5lyZOs059ufCIstzmYOVfmJeA4S/qwowDRI019zdyueddQLbXSzv+t+Jsq64hETC02
	+hX9eJHH+OhQpMQxWnGDs14vIXqxqA+40dc8IMigKNAAsfedgOkXoOTPzIMla
X-Received: by 2002:a17:90a:9292:: with SMTP id
	n18mr15905868pjo.120.1629973931461; 
	Thu, 26 Aug 2021 03:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcv+0YzZCucQ0ox87Pox7NC5munlHlqfui/yRJbQ8po2f6/X+bZL8pSH7E3PAGx2GMDYMERA==
X-Received: by 2002:a17:90a:9292:: with SMTP id
	n18mr15905835pjo.120.1629973931018; 
	Thu, 26 Aug 2021 03:32:11 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.69.35])
	by smtp.gmail.com with ESMTPSA id
	x26sm2567346pfm.77.2021.08.26.03.32.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Aug 2021 03:32:10 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 26 Aug 2021 16:01:55 +0530
Message-Id: <20210826103155.72744-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1629973932-311823-5492-48280-1
X-BESS-VER: 2019.1_20210820.2037
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.234120 [from 
	cloudscan10-170.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [oe-layersetup PATCH v3] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Thu, 26 Aug 2021 10:31:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Priya N S <priya.ns@ti.com>
---

Hi All,

This patch adds the processor-sdk-07.03.00.005-config for the AM335x
and AM437x 07.03 release.

Changes made in the V3 patch:
* This corresponds to the 07.03 release for the am335x-evm and
  am437x-evm platforms.
* The meta-linaro meta-layer is removed because the meta-optee needed
  for the build is moved to meta-arm from the dunfell.

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


