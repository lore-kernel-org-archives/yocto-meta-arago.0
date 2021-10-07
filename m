Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 8AB4952B46
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 14:09:34 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
	[209.85.216.72]) by
	mx-outbound46-48.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 07 Oct 2021 14:10:13 +0000
Received: by mail-pj1-f72.google.com with SMTP id
	o4-20020a17090ad24400b0019fc1b0342dso3746181pjw.9
	for <meta-arago@arago-project.org>;
	Thu, 07 Oct 2021 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ad5AkEhjSJUsMVBlDaggW3V6P6JZKnEaCZc9aNexqaA=;
	b=nizKAj3+zovqs5sTUnpj/Y9h3NNckgETvOixo6EmuUyJ5B9+YcZKwuy6lfrGPM0whO
	AqkJFCJgFRXoWcBIn7E/zpTjAJRWr/E/I/igC1BgmUQgf8ytCbRZGpmyO1dr5ovLzc5I
	kW7ReP6cr1pTuGTYlWrEASKOJn5o7Ap4TisM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ad5AkEhjSJUsMVBlDaggW3V6P6JZKnEaCZc9aNexqaA=;
	b=7fEdfAlkb/QTNtBsGminTyp1dwZQ3AeXZW3oyEWWMsDIgp8jeD/zCZ5HXbQRoNCety
	srwf510UJFb4bwAQBVCHM7KUqpo5yP55lJIOk0ZJfy9UdeZKZJDhscWkSSAbljZ5MlQf
	sqkr7Gp5AUECfpNlGohiHdVFyXJi/5/pl6V8GCuJOZsn8oQbg+8E600HMYSvGtisLWGn
	l0NKulxX1LGTVOoHifIJNSkWRUO/+0NFFpTUWze4VY8D5uQfBzV9rbwTcfKnf2DHKWGZ
	lh+Hzotqa0UINMX1x0mvQpXoN8aCuDx/DKdkaoj+VLhf3RxohnQrR7oBKPYMztaZ00Ul
	xYoA==
X-Gm-Message-State: AOAM531GGaTBT2yHrEb2T/YT+ccJJVchSYTRZ6bSazjHxfiTDnJ6t5Bt
	GJKr9hwr+Qzxf6SKAjQkfJRhAA/IUUSAXHcJr9BWK5WfMkY+lQgWyJtP3RoRI74jB3LmX3ZAQy6
	bDcG5P5Nkj7Cp3C7Md3LCwh9oHrg3NET+Z++T2/uo4kT98kccBlSK+tYgMS8N
X-Received: by 2002:a63:d251:: with SMTP id t17mr3589725pgi.68.1633615811998; 
	Thu, 07 Oct 2021 07:10:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyczIVPnJWz4LVyP8iXznofIDqtkGH9WcF17APqZ/c4KKnmelhVZTAef61t6+5N8L6GTMttw==
X-Received: by 2002:a63:d251:: with SMTP id t17mr3589699pgi.68.1633615811736; 
	Thu, 07 Oct 2021 07:10:11 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	k14sm25123758pga.65.2021.10.07.07.10.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Oct 2021 07:10:11 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  7 Oct 2021 19:39:38 +0530
Message-Id: <20211007140939.19819-2-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007140939.19819-1-sinthu.raja@ti.com>
References: <20211007140939.19819-1-sinthu.raja@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1633615812-311824-8534-4727-1
X-BESS-VER: 2019.1_20211006.2200
X-BESS-Apparent-Source-IP: 209.85.216.72
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.234990 [from 
	cloudscan10-233.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master][PATCH 1/2] packagegroups: tisdk-connectivity: package intel-9260 linux firmware images
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
X-List-Received-Date: Thu, 07 Oct 2021 14:09:35 -0000
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

linux-firmware-iwlwifi-9260 and linux-firmware-ibt-18 containing
firmware for Intel 9260 (WLAN and BT)

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 1eb0e072..98a1dacf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r41"
+PR = "r42"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,6 +18,7 @@ WLAN_COMMON = "\
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
+    linux-firmware-iwlwifi-9260 \
 "
 
 WLAN_TI = "\
@@ -42,6 +43,7 @@ BT_COMMON = "\
     pulseaudio-module-bluez5-discover \
     pulseaudio-lib-bluez5-util \
     sbc \
+    linux-firmware-ibt-18 \
 "
 
 BT_TI = "\
-- 
2.31.1


