Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 797AE52AA5
	for <meta-arago@arago-project.org>;
	Fri,  6 Aug 2021 11:49:02 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
	[209.85.216.72]) by
	mx-outbound40-87.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 06 Aug 2021 11:49:15 +0000
Received: by mail-pj1-f72.google.com with SMTP id
	z17-20020a17090ad791b029017763b6fe71so9816474pju.3
	for <meta-arago@arago-project.org>;
	Fri, 06 Aug 2021 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gU1+TjimAF1lxVyDRNS0pgVRIMrxvopBB78TlzrutwE=;
	b=ad3m0htT3aq62qxHlXC8COMGbC7JppELOJlTFNqUYWUmIJpv45Kq6jvDncZpdKda73
	gaIJNC1ZRCL0n5Ojs5ltXKEjdOddVsP/QN9O3M2rYbMoK225pS+8TZMOBtvaIXwU02sh
	v5wwLHcGT45DMUKdshPMRgZW+N4ejlFxYPhyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gU1+TjimAF1lxVyDRNS0pgVRIMrxvopBB78TlzrutwE=;
	b=Mu/DfGnyPJRBjLTQimMCe+NE69WWQrsffwX7CwiSTLEcSkOrzMdfm9C+I/rslNvl2N
	H23ULXYlLlaTHaVK/DlaUbIuWYhKA35JymcCZkOiQMnoasUP68f7zL4ZJl6dSM87qLoj
	XqZKiXHEZc9j101Dl2SdMeODeUGJR8CEWGmCNBc6bzCTh50B/Gy8QDTByqW+vWhjE10K
	zsibqKT8px9YioiKyryRWAQZVMEwGH6wlAeVt7557B/PHOqvdPW2JMtCWdnjKTtRoCZh
	B5RnwbxZNK3/aq+++Ul00457dkKonuvrOL78PEdMqvc0WWXOkiQQrfM3X75EH8wDcDvJ
	tjxQ==
X-Gm-Message-State: AOAM531ar0g2MlMLylpaTSG3RbtfAxQVuWnMrk6nXlyWkPoJEcr+YGY+
	7cxWiLIWhgVDNJ46KbiJSWe0fi+lVh5+Uv0j1rSnOnUQ/GwfdA5hr7hVah4uV1xHao8FniPpZW/
	pbG/zSXTGHkvMUcqIkFZTcCsFsTKkh7xHWK/jWy66TA/YokeJA5m68IpdDiWu
X-Received: by 2002:a65:5309:: with SMTP id m9mr26905pgq.38.1628250554207;
	Fri, 06 Aug 2021 04:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWGwe2nz06N1+1f0hFWtYx8IUbb37NwswoX6f0D6wrjahIdCGewoCnOV6/6AeVZ7GdK9PTdg==
X-Received: by 2002:a65:5309:: with SMTP id m9mr26884pgq.38.1628250553922;
	Fri, 06 Aug 2021 04:49:13 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.69.35])
	by smtp.gmail.com with ESMTPSA id
	s133sm10772615pfs.190.2021.08.06.04.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Aug 2021 04:49:13 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  6 Aug 2021 17:18:52 +0530
Message-Id: <20210806114852.60704-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1628250554-310327-29073-21203-1
X-BESS-VER: 2019.1_20210805.2250
X-BESS-Apparent-Source-IP: 209.85.216.72
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233888 [from 
	cloudscan19-42.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [oe-layersetup PATCH v2] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Fri, 06 Aug 2021 11:49:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Priya N S <priya.ns@ti.com>
---

Hi All,
Kindly ignore the changes made in the V1 patch and consider the
V2 patch.

Changes made in the V2 patch:
* Added the processor-sdk-07.03.00.005-config for the 07.03
  release.
* This corresponds to the 07.03 release for the am335x-evm
  and am437x-evm platforms.

 .../processor-sdk-07.03.00.005-config.txt       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-07.03.00.005-config.txt

diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
new file mode 100644
index 0000000..09bde9e
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,HEAD,layers=
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dunfell,HEAD,layers=meta-optee
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
2.19.1.windows.1


