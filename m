Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 8B3A852A71
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 12:50:13 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
	[209.85.214.199]) by
	mx-outbound16-185.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Jul 2021 12:50:26 +0000
Received: by mail-pl1-f199.google.com with SMTP id
	a16-20020a1709027d90b029012bf391b9fdso4924090plm.2
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CWpvIc2ODi8BTPio7WmeAOfPanQXqXAR2b32drDU2wM=;
	b=lKBv0yTmb+dWh5nyzhuvk/yaVsBjCWQiBqR59wPvuSP7lAhNLpkrtzbYGrd1hzuJiw
	DkscqAb8Td6TKE+sLhlRQjp9sA+IyQMz6DRnXVVNYv0HCRmM2Ohnlqug8qb9qxojPMnb
	VzwnnW4MhLswqrdXOoALUOsAAoOfRoPhPwVVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CWpvIc2ODi8BTPio7WmeAOfPanQXqXAR2b32drDU2wM=;
	b=gFeEQqfgGWx+Y87cmu7oQ6ngTSi1hFav/h17aboQHd9h+RMKrBx+VJtyOqUgB5urbq
	CrWVuYlJz6QDILTpnO/ZSv1wFozdjJCgxfPe/wYt46PAzjqnqogMGMtDe6fETBj20dQK
	kcxRgR1tiwd+eVHXXFfo4/mY5ol4kxhCqhrF+xipjCWxyTvVdBpnHL+dJ87OFm14Tp2I
	7Yx5hkPo8hZNLZx5WqWuBuqL9GbREkeq4qXRtC7TY0irQ/6XlBE2MU8pmOA5LRZDb54U
	CGQHk3mppOms+o6fA6bu+513RPPYqmI6VG9foPw2bMhqVDO/V4vT9n5uGfah3T0e3kyT
	6OUQ==
X-Gm-Message-State: AOAM530OEgPpU2x9G9xyhqGmkp5eUsA+35i3P7HwjHZthL6xYd0BiQz4
	Vn5NwWehc9NAN58gjUUG93s1A+r1xa8XNiEzNRS4WRoZW0DPYyqP+IvuwQlqD96G1Kp6V9enPdQ
	J3FE/ZcZADgA9pm9UljXvL9rjX/sOOvpMLuP/2Vls9cFny3FE76Gd+uzVhj8C
X-Received: by 2002:a63:e250:: with SMTP id y16mr3693165pgj.247.1627563024811; 
	Thu, 29 Jul 2021 05:50:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1qEQfnFIFtB21h378XZYI+NIBZ1fivTABElLOfwZK9c1u+mVW3JYF8S9L+HLmqRky3QwDHw==
X-Received: by 2002:a63:e250:: with SMTP id y16mr3693147pgj.247.1627563024578; 
	Thu, 29 Jul 2021 05:50:24 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	f3sm3705863pfe.123.2021.07.29.05.50.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jul 2021 05:50:24 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 29 Jul 2021 18:20:09 +0530
Message-Id: <20210729125011.9120-3-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210729125011.9120-1-priya.ns@ti.com>
References: <20210729125011.9120-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1627563025-304281-5373-77125-1
X-BESS-VER: 2019.1_20210719.2036
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233794 [from 
	cloudscan17-144.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V4 2/4] create-sdcard: Fix wrong rootfs tarball selection
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
X-List-Received-Date: Thu, 29 Jul 2021 12:50:14 -0000
Content-Transfer-Encoding: 8bit

* Validate user input of rootfs tarball selection.
* This will not allow the user to proceed with wrong rootfs
  tarball selection.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 264095a..d052312 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -766,10 +766,19 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
-		echo ""
-		read -p "Enter Number of rootfs Tarball: " TARNUMBER
-		echo " "
+		COUNT=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print $1'} | wc -l`
+		while :
+		do
+			ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
+			read -p "Enter Number of rootfs Tarball: " TARNUMBER
+			echo
+			if [ -z "${TARNUMBER//[1-$COUNT]}" ] && [ -n "$TARNUMBER" ] ; then
+				break
+			else
+				echo "Invalid selection: '$TARNUMBER'. Please use values from 1 to $COUNT"
+			fi
+			echo
+		done
 		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
-- 
2.19.1.windows.1


