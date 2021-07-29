Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 65ABE52AAC
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 12:50:18 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
	[209.85.214.198]) by
	mx-outbound46-150.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Jul 2021 12:50:31 +0000
Received: by mail-pl1-f198.google.com with SMTP id
	v6-20020a170902d686b02901019f88b046so4908223ply.21
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/zEimQ1wF7uCgeZjVQqTsDmFAyTVhLtyjLnTdHMTypA=;
	b=irSWb5oBhEamfNlGhcQ5FjTv6It4EBsg5cprKMEpnTsFnxD+p0fEZNEyxOXrJYD7Az
	+GAyOb4GjOtFmKNREcbbyImmTVBBHvd4Km02Vlw2rs5CX4UQvy8BnVzJJAJ6Iq1xaz7a
	BMiprExXnfVleR4c2jkVA4SkewWyu2X2aTI7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/zEimQ1wF7uCgeZjVQqTsDmFAyTVhLtyjLnTdHMTypA=;
	b=hX+q90Mqw6YG6CuYqAW5M/sieb+nJjz4mgFgGCnOoV1TeoML6+2OroMe3Ie5c9T6pA
	Id9qr02FSCVjgRjd7bmf2TmIwYxl2MVt9S4Q6s0YM71XfFCZ4s/GC6eMnHt/g8XFTv17
	ksaKDcH4Uj3rl1Iv2ziaOndH8pgCJExocuMDLLClURAVXVVlFZldLy0A4PuD8FSwzTs/
	ezrbuSMSez92mtKzY0619mds7vkC+MtJAWz/gOYwb+dQ8fNi0/yaU0Tjitl75j2nejSt
	T8ODs7ELZI2n5az1E6DJnWxK55Kn0yPA0VbBHJm4n5wDV/l0hEAyujbhh3wbw1r6IaXA
	dv0g==
X-Gm-Message-State: AOAM533fU2TrWkrk+wg/yBlWzeibaQ/2/t17nzCZfjc4CTIMLF+JY6qB
	lvcpQhGJ9ngzfet4jYJe8ygS0gL1g/UiCT+UJaxAtEM6yDRU5FzE4OBj7Iwu9POyqLtbNsyuCHm
	N30XLMOh5KVnQx21aXtqBaTzCxaoMlAPcthJcQpDHCI4/d3V4S7F5MWnF8W4e
X-Received: by 2002:aa7:9ec3:0:b029:32b:4eb5:4bad with SMTP id
	r3-20020aa79ec30000b029032b4eb54badmr4866479pfq.6.1627563029065;
	Thu, 29 Jul 2021 05:50:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8o9ipGGWl8lvnpQAa5EIW1e9UNPZ3ZdA7XyrObjMPTxB1KLcRS5g+DvZGyV1Ms62etit+hA==
X-Received: by 2002:aa7:9ec3:0:b029:32b:4eb5:4bad with SMTP id
	r3-20020aa79ec30000b029032b4eb54badmr4866461pfq.6.1627563028828;
	Thu, 29 Jul 2021 05:50:28 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	f3sm3705863pfe.123.2021.07.29.05.50.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jul 2021 05:50:28 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 29 Jul 2021 18:20:11 +0530
Message-Id: <20210729125011.9120-5-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210729125011.9120-1-priya.ns@ti.com>
References: <20210729125011.9120-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1627563030-311926-31000-69828-1
X-BESS-VER: 2019.1_20210719.2036
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233794 [from 
	cloudscan22-191.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V4 4/4] create-sdcard: Increase boot partition size to 128 MB
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
X-List-Received-Date: Thu, 29 Jul 2021 12:50:19 -0000
Content-Transfer-Encoding: 8bit

Increase the boot partition size of the SD card to 128 MB so that boot
partition size is in sync with the WIC image boot partition size.

Signed-off-by: Priya N S <priya.ns@ti.com>
---
 create-sdcard.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 546588b..a647ccd 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -382,7 +382,7 @@ done
 
 PARTITION="0"
 if [ -n "$SIZE1" -a -n "$SIZE2" ] ; then
-	if  [ "$SIZE1" -gt "72000" -a "$SIZE2" -gt "700000" ]
+	if  [ "$SIZE1" -gt "128000" -a "$SIZE2" -gt "700000" ]
 	then
 		PARTITION=1
 
@@ -506,7 +506,7 @@ n
 p
 1
 
-+75M
++128M
 n
 p
 2
@@ -582,7 +582,7 @@ n
 p
 1
 
-+75M
++128M
 n
 p
 2
-- 
2.19.1.windows.1


