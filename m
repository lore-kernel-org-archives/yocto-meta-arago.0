Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 99D9352A72
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 08:44:25 +0000 (UTC)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
	[209.85.215.198]) by
	mx-outbound14-245.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 07 Jul 2021 08:44:29 +0000
Received: by mail-pg1-f198.google.com with SMTP id
	p2-20020a63e6420000b02902271082c631so1226636pgj.5
	for <meta-arago@arago-project.org>;
	Wed, 07 Jul 2021 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v8uOGbWeIY1q5vcqfvIu0kmQI35gztLzkiByuk+SjVU=;
	b=JWPBhWE5uCDc2Qo8MCxmBOxoSUsxl8qJp5vhK1EBnkY/I8aKucOu297tz3BBuLjP5M
	arTfkXD32tgzYYe9n/uLXMYWQNofkgA3RD0EmswHnLEEHWGPZ+dfF2cAVDorEIAztLu8
	OfKHP6XSxpCBlWeQ+hFbzc0BFp8tj7oIZjWJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v8uOGbWeIY1q5vcqfvIu0kmQI35gztLzkiByuk+SjVU=;
	b=kZ1IaBN1WMvASa0ZDcS/DypQvSW3IpzUXlDHHkyX/Sh9S/gsI0mvmFnLeYKzcIVeqV
	PtCEy1IUKqm44X+wzVGiK/b7XyYZ8nIpaOPR0qMkAKWL3lZ17i7eo8P+SLY5OEQP8UsH
	yac/xkPIwu+qkSyyjl5+KOvfTovMigMRd9kRoel9BwkK0ewLwgttTuY3cmKhd9gdHLCL
	ibPeNVEtH2idnuKhopQLKDNDt7W2t2M3o5Sgl8KjnDkYWvP2vu7Qzl1QcQ+6UpTvAjAs
	bgvzkLLAgDentdBKEpsj+xTfbH9U1FdoA2z4e2D92krnzAA8jgdJbDsenrV+X5qX1Pzu
	u1Mg==
X-Gm-Message-State: AOAM5313XHgqeaXTSZD3smxNqgOB1WUlqjNhWTKSxwOEBPBT0un+l6df
	T5d+XE4ueabvCiRSHxGv2IJkrzUzfbngm2pIdRN3MZ5RaoLDVq/wYjRUtVab88uEwMUrtnUsUqf
	AXse0JNKxc1GGr1LQDP8PXnTFK17UismEA59YPjJP6jCeHUNQ1m6UyxvkeDrx
X-Received: by 2002:a63:e14:: with SMTP id d20mr25669495pgl.35.1625647467905; 
	Wed, 07 Jul 2021 01:44:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz07584AjSZF2URpMboUeRuFjE48A1rFsF3tUVi9DMpEpUSHVPrtJhogUDIF7M/qBg4a4mjGA==
X-Received: by 2002:a63:e14:: with SMTP id d20mr25669483pgl.35.1625647467636; 
	Wed, 07 Jul 2021 01:44:27 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.51.169.79])
	by smtp.gmail.com with ESMTPSA id
	d1sm17126581pju.16.2021.07.07.01.44.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jul 2021 01:44:27 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Jul 2021 08:44:11 +0530
Message-Id: <20210707031414.46720-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1625647468-303829-21307-14741-1
X-BESS-VER: 2019.1_20210706.2354
X-BESS-Apparent-Source-IP: 209.85.215.198
X-BESS-Outbound-Spam-Score: 1.09
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233441 [from 
	cloudscan16-193.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	1.08 DATE_IN_PAST_03_06_2   META:  
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.01 DATE_IN_PAST_03_06 HEADER: Date: is 3 to 6 hours before Received:
	date 
X-BESS-Outbound-Spam-Status: SCORE=1.09 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=DATE_IN_PAST_03_06_2, BSF_BESS_OUTBOUND,
	DATE_IN_PAST_03_06
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V3 0/3] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Wed, 07 Jul 2021 08:44:26 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

Hi All,
Changes from previous version:
1. Fixed the rootfs tarball selection user input validation logic which
   failed for some cases.

Priya N S (3):
  create-sdcard.sh: fix regex used for rootfs tarball
  create-sdcard: Fix wrong rootfs tarball selection
  create-sdcard.sh: Stop using cylinder as unit for partition size

 create-sdcard.sh | 74 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 17 deletions(-)

-- 
2.19.1.windows.1


