Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id E363C52B6B
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 13:44:54 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
	[209.85.210.199]) by
	mx-outbound12-72.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Jun 2021 13:45:40 +0000
Received: by mail-pf1-f199.google.com with SMTP id
	j24-20020a62b6180000b0290303645fae06so3260023pff.22
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MtClifK3t9XBSCBD6zby/iUwRDpGxmvoaoMnyecYEfU=;
	b=PsSQK782Hp/ByjVlIAwyPqH0yJT3fhSk6JbkB1Mz4P/esQ2UD8xJpUMEnTW3OdrWcq
	JaUiHPLX+0vlNBI4+RmRAkEvsyuBmgM4Yr3xuBauoEgPD0tFnHU9M/SsZ60pjTm/Jf3l
	0RHdg1jGPj3vMB9JgD3PbKt8oyQo3NBK2yQ8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MtClifK3t9XBSCBD6zby/iUwRDpGxmvoaoMnyecYEfU=;
	b=qzP10pkQCYupuGEb49FN9wWlyn1BGMCOpSB1pTpTYYWenGIEn0PZ5mFeveTuAoMqsi
	8SeLcwdtBhE8M9f3Y54I+tEcB9yccMorGc8Xml2y4rI2nept7Z5uhOY58Zzj6Y35MbXx
	A5C568CnxgclCNFHQN9MjIZLOpixoDAYwB5N/9xGE6uHGgshBy2FhQgiA1bfYk/TXUfu
	As6horcrYpUONLG39lZnG2b3pRK1FhhnL+wMm+puocfaecqPo9TIE8yo7lxTHjHkpXkd
	gEqbkagXb0a6UZIwhYGayKQSDmsIHfcV9A77PY27o8s0H31YdBWD+0jdizRtDFUjPweY
	t6lA==
X-Gm-Message-State: AOAM531AFP05NkwaKQiZVilNERDvfabMdvQed22aUrcVo+jvo1Oh2ViB
	f7sFY7xOd/1qp8MwvrSeVFoXl1mtUt3S1eF6Fuvlhbyx5hw20vl/kmjC+rL49f0lx804kjAlgt2
	vdtkooP9qfR3DjxSNfTYg5JaADoghynm6sF0jhLwaqdtz75BsNsnkYyyJldNk
X-Received: by 2002:a63:ee53:: with SMTP id n19mr3891912pgk.268.1624369539542; 
	Tue, 22 Jun 2021 06:45:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnO83DsBRuwMs6Gzsu6u7BZv/CI6H05arwzpPX0EYbmrseDGVhRGbBw4fMvltoy99qnOonyw==
X-Received: by 2002:a63:ee53:: with SMTP id n19mr3891885pgk.268.1624369539179; 
	Tue, 22 Jun 2021 06:45:39 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.49.90.247])
	by smtp.gmail.com with ESMTPSA id
	n23sm19132178pff.93.2021.06.22.06.45.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jun 2021 06:45:38 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Tue, 22 Jun 2021 19:15:00 +0530
Message-Id: <20210622134500.87848-4-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
References: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
X-BESS-ID: 1624369540-303144-3797-120533-1
X-BESS-VER: 2019.1_20210618.2139
X-BESS-Apparent-Source-IP: 209.85.210.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233105 [from 
	cloudscan17-37.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V2 3/3] create-sdcard.sh: Stop using cylinder as unit for partition size
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
X-List-Received-Date: Tue, 22 Jun 2021 13:44:55 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

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
index 8f99687..1114f70 100644
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


