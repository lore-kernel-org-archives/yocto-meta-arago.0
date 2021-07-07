Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id EB42A52A72
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 08:44:32 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199]) by
	mx-outbound42-17.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 07 Jul 2021 08:44:36 +0000
Received: by mail-pg1-f199.google.com with SMTP id
	j13-20020a63594d0000b0290228b387f4a3so1220350pgm.13
	for <meta-arago@arago-project.org>;
	Wed, 07 Jul 2021 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mL1und60dY2rxVd/FchYbQbobH256/dJx7+QlljOIMw=;
	b=MQUwjjucOQg6lDHZ4hb1LpJQlM+/9txyBJm3n2OuquLPkd7E0dVkHY5b182LIrxxrZ
	Li0Z/+T9wo+B21jzyH1RzWhHCgYfCZud/714VTxlrjwTmhgPckOwVcuS6pKwvOXfSlDF
	8tmtMh3antEoh832Lw5FiqpmKqzg4mHkai2yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mL1und60dY2rxVd/FchYbQbobH256/dJx7+QlljOIMw=;
	b=q1vCw8BF50+UmTxzXEhm4PE6GTIB6dpqfmHhRYqD3UTSoy9zqQiTWhimJ3OjqvPZIG
	1ACakWoA4zePE9R7ti9xlkYk0IQ7LktZRpAtjTGRl7q9HGQptyeIAtTtXZS60CV9lKu9
	9o2VdMWxPSepUTVc5T17EjJkCwifwMg2A8H5hncZ/VAWl7de6Kr1vXi4ScNGj9gbyL4O
	WIKcVnaSIHN8+z+JnOz/c6zKKG4Qw7/yyiYrWBl7nVAVfLstTNRu2DqgYQL/PSLgvAs1
	eIp2xgdjQkAEpMGTZgcfeojdMS+f67avdXNCXsiAScrwIxTmfy9I7cM4r+oMDa3Eq0QD
	MoaA==
X-Gm-Message-State: AOAM531/hFGdR2osbHgJAYWtnwGX+8xXfi3im/YejBrLV3uBR80nBXpy
	BTHhP7OCiDkLbxtnZQD0i5nwHfa4TZnw/Wl3Nmu76P7JPCLTzi0DlTiW1FvIjEO5LqVRagHUiJV
	H1zCJXEvJy4eMj13flmWplxx4PDj2O3Rn1oBucnXWRyawKi26o+pcpigQOkJT
X-Received: by 2002:a17:902:d20a:b029:129:b7ab:a248 with SMTP id
	t10-20020a170902d20ab0290129b7aba248mr4540715ply.32.1625647475680;
	Wed, 07 Jul 2021 01:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCphbsRpNE0eHezbAWM7h+FrZ3Yq8K8lYXWwQth36A5TCFsZ1AKJtipDh+WFNHJUjO2YxXUg==
X-Received: by 2002:a17:902:d20a:b029:129:b7ab:a248 with SMTP id
	t10-20020a170902d20ab0290129b7aba248mr4540699ply.32.1625647475453;
	Wed, 07 Jul 2021 01:44:35 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.51.169.79])
	by smtp.gmail.com with ESMTPSA id
	d1sm17126581pju.16.2021.07.07.01.44.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jul 2021 01:44:35 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Jul 2021 08:44:14 +0530
Message-Id: <20210707031414.46720-4-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210707031414.46720-1-priya.ns@ti.com>
References: <20210707031414.46720-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1625647476-310769-23169-14533-1
X-BESS-VER: 2019.1_20210706.2354
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 1.09
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233441 [from 
	cloudscan20-223.eu-central-1b.ess.aws.cudaops.com]
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
Subject: [tisdk-setup-scripts] [master] [PATCH-V3 3/3] create-sdcard.sh: Stop using cylinder as unit for partition size
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
X-List-Received-Date: Wed, 07 Jul 2021 08:44:34 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

* Cylinder size of sdcard is manufacturer dependent. To standardize
  sdcard partitioning remove the use of cylinder (cyl) unit.
* While at it shift to using fdisk for the partitioning the sdcard.
  fdisk is already used in the script and this reduces the dependencies
  of this script on available installed applications.
* This fixes cases where already partitioned cards were being detected
  as not partitioned because of size check elsewhere in the script
  failing.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 50 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index d052312..546588b 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -501,11 +501,29 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
 
 echo DISK SIZE - $SIZE bytes
 
-parted -s $DRIVE mklabel msdos
-parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
-parted -s $DRIVE set 1 boot on
-parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 310
-parted -s $DRIVE unit cyl mkpart primary ext2 -- 310 -2
+cat << END | fdisk $DRIVE
+n
+p
+1
+
++75M
+n
+p
+2
+
++2.4G
+n
+p
+3
+
+
+t
+1
+c
+a
+1
+w
+END
 
 
 cat << EOM
@@ -559,10 +577,24 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
 
 echo DISK SIZE - $SIZE bytes
 
-parted -s $DRIVE mklabel msdos
-parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
-parted -s $DRIVE set 1 boot on
-parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 -2
+cat << END | fdisk $DRIVE
+n
+p
+1
+
++75M
+n
+p
+2
+
+
+t
+1
+c
+a
+1
+w
+END
 
 cat << EOM
 
-- 
2.19.1.windows.1


