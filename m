Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id 4527F52B6E
	for <meta-arago@arago-project.org>;
	Mon,  7 Jun 2021 10:38:52 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
	[209.85.216.72]) by
	mx-outbound41-238.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 07 Jun 2021 10:39:31 +0000
Received: by mail-pj1-f72.google.com with SMTP id
	x15-20020a17090a46cfb029016dd9f9451bso4981737pjg.2
	for <meta-arago@arago-project.org>;
	Mon, 07 Jun 2021 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MtClifK3t9XBSCBD6zby/iUwRDpGxmvoaoMnyecYEfU=;
	b=bBh3QawI0LiVzJ2r1/TYnqmEC7m+mHo1XdujJ7VO9zVjP330euBtBU7XEuJ2Sedrti
	33eLTyo7RoZodILdh+4iGNj64Ia44UQ5MZX1YdI1yfZ3AoDH1RoE/aSDLk4C/tq28BSW
	lBSCHHEkNaYgwflOq2wsduYS+noOplQiQYjT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MtClifK3t9XBSCBD6zby/iUwRDpGxmvoaoMnyecYEfU=;
	b=ZXfVDeF3Ai+kl3pDs7Z1N76UwBS2/a5R8BN/0n4EL1c9SBWvJEfD+vnJc/UInwDTCm
	eggPXj0atSm11BzV7kNUggbw4B+U+TME4BqQoG9luU+ZJOFYAtIrUGKah3uUGg1mejoB
	tRMuXWgah2UcVdko0tkioZsZa+Yzh26opNtBMJFGfMmO5HYK2uYKMb0fbWxIPrfVAnAe
	B8cgMu6pnxYzKUAMZ8yEWZFvCjx2GneGGPhMR6riZOG2Mz3BSel07/cJZ3Q6+eKQ0GtA
	IAyF5gyvBpYO7z/3Z2ZQkDhxR4vu0o+C+sA7I/gPdjsvAeusDg8TwHIRqChUgrT9+Y5O
	3WuA==
X-Gm-Message-State: AOAM5313ASibvg+qlgf1KZYktE1zjUssmsKqrdqL50YL1hpZuKrzTaxX
	ztLPK4h7aVu630MJamLaEyzAY2U84aDg/aewAVqZJLBUX1STcTAWMcAKIHlxm+pTiDr7Yb4O+O4
	ElejNvdw0aXvgKa+FPAPu4uhk7mM9g8UXLkVDuwyNmsBpy52Y2ysOOBgeqafb
X-Received: by 2002:a63:4a49:: with SMTP id j9mr13348927pgl.234.1623062370603; 
	Mon, 07 Jun 2021 03:39:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNGxO++Yn+5MUMjGS6ZN4IpTnj18vovvtTvoz7F4lFto/1eooBl6HlaaRYQkLUiEc3xjB1ug==
X-Received: by 2002:a63:4a49:: with SMTP id j9mr13348918pgl.234.1623062370378; 
	Mon, 07 Jun 2021 03:39:30 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id l8sm8508706pgq.49.2021.06.07.03.39.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jun 2021 03:39:30 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Jun 2021 16:05:39 +0530
Message-Id: <20210607103539.72720-4-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
References: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
X-BESS-ID: 1623062371-310734-5412-477-1
X-BESS-VER: 2019.1_20210603.1645
X-BESS-Apparent-Source-IP: 209.85.216.72
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.232773 [from 
	cloudscan15-76.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: M V Pratap Reddy <pratap@ti.com>, Sekhar Nori <nsekhar@ti.com>,
	Priya N S <priya.ns@ti.com>
Subject: [master PATCH 3/3] create-sdcard.sh: Stop using cylinder as unit for partition size
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
X-List-Received-Date: Mon, 07 Jun 2021 10:38:52 -0000
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


