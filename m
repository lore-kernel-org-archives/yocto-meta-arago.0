Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 8298F52B55
	for <meta-arago@arago-project.org>;
	Tue, 28 Sep 2021 11:05:29 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
	[209.85.216.72]) by
	mx-outbound40-188.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 28 Sep 2021 11:06:01 +0000
Received: by mail-pj1-f72.google.com with SMTP id
	hg6-20020a17090b300600b0019eec013c12so4925356pjb.5
	for <meta-arago@arago-project.org>;
	Tue, 28 Sep 2021 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6Te1DttJAS/2ElytL7KlPh2dJKoIwKTJ+XBr+WQmG+8=;
	b=jQfKlQMN066vNAoU4sQRKI+K4KtbcxG+VJ4Av2DLIGGAb2iZz6VQGjaAont1kBK3/K
	T9Z+amM36CGHJCVLeozNeNy4efOApbVfgXt3DrnnxZdUwJVu58Q0SGMNLX+Hl5gUA9H0
	2mSeY1U2pUVEzNnGUIcTKOGIPmKIfFJ2ZO6oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6Te1DttJAS/2ElytL7KlPh2dJKoIwKTJ+XBr+WQmG+8=;
	b=aw4nbCmp1henlH6oacmOPM3v29tuNi4hiPC1S149ilZsssjTJY9/DmSe9kPaKFwGSQ
	EP87Tp6dp9xRKQaxLRUU0+eBJZ9jMa/ozgV6h76flIP4BMPSzydFzbpMpLh+6Me+fYX2
	S4lKp0uJJ9i0/TjZV4AT2i9PP2BjSp7htAaSVq9m4sVQwVm/BLv/+oAeDrcj84SVmI79
	rieOEewwwdWnA5upDkkN6OvBQ33adEcNvYCcfqY7I2Cw/2fd5P7vznkMt+cRvJWjjzHm
	H/lLqpdlWOBjFe6IhxGGMXlBVm3sgt8zsdRFuZZ4kNlKq5h/ILbLweEcysaPme7qoeQc
	R5wQ==
X-Gm-Message-State: AOAM533+Esx39SIvxan9dbqqVGERgv4jxkFd6cebRPaFsM1W7UMG37TR
	U0cT75S9s40ERfWPRFFeWaSH0LYnraRDFaVlpl7NZPOmmnXw81Y5mSckVonL1Sh6JD2HVMyNwJJ
	baZRECvdqPjYJPJ+qc6copRdUvhXRpdWje0lZ3y7HJ5P08OcnUInKDVBx3peN
X-Received: by 2002:aa7:959a:0:b0:43b:adeb:ef58 with SMTP id
	z26-20020aa7959a000000b0043badebef58mr4690128pfj.19.1632827160376;
	Tue, 28 Sep 2021 04:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoSinnsTTe6Wzc8q5N4XMY4tePoqqkRnkn+gVdR+/x3RuxWc5MLySl68xSdBsA0got9y0D6w==
X-Received: by 2002:aa7:959a:0:b0:43b:adeb:ef58 with SMTP id
	z26-20020aa7959a000000b0043badebef58mr4690095pfj.19.1632827159989;
	Tue, 28 Sep 2021 04:05:59 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	c199sm20637224pfb.152.2021.09.28.04.05.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Sep 2021 04:05:59 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 28 Sep 2021 16:34:55 +0530
Message-Id: <20210928110455.38124-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1632827161-310428-5464-1237-1
X-BESS-VER: 2019.1_20210927.2125
X-BESS-Apparent-Source-IP: 209.85.216.72
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.234781 [from 
	cloudscan11-231.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [dunfell PATCH] ti-tisdk-makefile: Remove barcode-roi snippet
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
X-List-Received-Date: Tue, 28 Sep 2021 11:05:30 -0000
Content-Transfer-Encoding: 8bit

* barcode-roi support is dropped from meta-arago due to breakage with
  OpenCV 4.1
* Remove the makefile snippet from the installer toplevel makefile

Note:
* barcode-roi makefile snippet needs to be added back once barcode-roi
  breakage with OpenCV 4.1 is fixed.

Signed-off-by: Priya N S <priya.ns@ti.com>
---

Hi All,
This patch removes the barcode-roi makefile snippet from SDK top-level
Makefile for AM335x and AM437x platforms.

 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb    | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index d2201675..1320ec50 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -97,7 +97,6 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            cryptodev \
                            ti-sgx-ddk-km \
                            pru-icss \
-                           barcode-roi \
                            uio-module-drv \
 			   mmwavegesture-hmi \
                            pdm-anomaly-detection \
@@ -112,7 +111,6 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            ti-sgx-ddk-km \
                            cmem-mod \
                            pru-icss \
-                           barcode-roi \
                            uio-module-drv \
 			   mmwavegesture-hmi \
                            pdm-anomaly-detection \
-- 
2.19.1.windows.1


