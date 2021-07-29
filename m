Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 4A58352A71
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 12:50:12 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
	[209.85.216.70]) by
	mx-outbound46-150.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Jul 2021 12:50:24 +0000
Received: by mail-pj1-f70.google.com with SMTP id
	z17-20020a17090ad791b029017763b6fe71so2266383pju.3
	for <meta-arago@arago-project.org>;
	Thu, 29 Jul 2021 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QSn41wvIRzalAokRAUIg6RI1fgGgitk3YdpDcoYPQhI=;
	b=WnXPKqGcurobm1v6f90jqzXAGcFmkIOJCT1chj7fZW3QErJfhaWL3JtiHHJsJrtTxi
	xGGOcyk8nM+CVPfNanlvajN2pietyFDDIv5WhhU/ywRCB6aJ3ohDhwqyAfafGiG7WUpW
	WZGZqijW7sLV9P71d4MNMEXm+M1/6t9M2xUbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QSn41wvIRzalAokRAUIg6RI1fgGgitk3YdpDcoYPQhI=;
	b=iySK0EDuqJB/+ZKnnIAG/Nw0wIaadvRfTYbEWbzXQffwzs1mFV7idsg6qr1U404i+Z
	sYD+HK7fBUq2w19FMGmnAutsv+9u6xhmIQNyXwW2tcpCh5oKbwmSIHVMSLxidJ3XKZyP
	0s0WJOi0BYybC6wIRNzGChjn5i/WKXE5zLq32wHIyXaSs+b9itbdamjdLWyZPF3WqJcu
	JF1vuElkzld56PLnAg+qwmiifny5iPbeJEZfgnqCqdbF5r0CQcTpZiu++mv4wYHajZ0E
	9ohRKcUts47jPJm0gdORDo1N0TY530GinViM1YCuEWiNPUN9z7ideNvjqK43MEIN7RoH
	GL6A==
X-Gm-Message-State: AOAM533xear6uMc7GS+LE6gvZrev3yg/E2YJLK25NmrMtEOX/Oh+4m7i
	99C0uLnaE8LQ2f4bcm6JCxfqyARoqMRpJyqob3tUqwZXVUNnWsgRyuVKZ3qxDZ1ovg5m88xGgrC
	GhBBJic+GRxIReOhApDEIKvcfDmK8wYqQXQNooOuVdyIi+cU6CXsByR6CmQWm
X-Received: by 2002:a65:6118:: with SMTP id z24mr3669070pgu.325.1627563022808; 
	Thu, 29 Jul 2021 05:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe0wNHGscVQyEvIxW4NM/8QOzBzi8OhTEvb7eGEvnaDuJT5AG4f058vWIk97C8PntX8l8GPg==
X-Received: by 2002:a65:6118:: with SMTP id z24mr3669040pgu.325.1627563022341; 
	Thu, 29 Jul 2021 05:50:22 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id
	f3sm3705863pfe.123.2021.07.29.05.50.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jul 2021 05:50:22 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 29 Jul 2021 18:20:08 +0530
Message-Id: <20210729125011.9120-2-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210729125011.9120-1-priya.ns@ti.com>
References: <20210729125011.9120-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1627563023-311926-5335-71906-1
X-BESS-VER: 2019.1_20210719.2036
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233794 [from 
	cloudscan13-183.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V4 1/4] create-sdcard.sh: fix regex used for rootfs tarball
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
X-List-Received-Date: Thu, 29 Jul 2021 12:50:12 -0000
Content-Transfer-Encoding: 8bit

Filesystem tarballs present in SDK are in the format
tisdk-<IMAGE_TYPE>-image-<MACHINE>.tar.xz. This is different from
earlier format where 'rootfs' was present in all the filesystem
tarball names. Update regex used for filesystem tarball search to
use "image" as the keyword.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 736cd42..264095a 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -752,10 +752,9 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
 	#rootfs
 	ROOTFILEPARTH="$PARSEPATH/filesystem"
-	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*rootfs | awk {'print $1'}`
 
 	#Make sure there is only 1 tar
-	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
 	if [ -n "$CHECKNUMOFTAR" ]
 	then
 cat << EOM
@@ -767,15 +766,15 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
+		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
 		echo ""
 		read -p "Enter Number of rootfs Tarball: " TARNUMBER
 		echo " "
-		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "rootfs" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
+		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
 	else
-		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
+		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | awk {'print $1'}`
 	fi
 
 	ROOTFSUSERFILEPATH=$ROOTFILEPARTH/$ROOTFSTAR
-- 
2.19.1.windows.1


