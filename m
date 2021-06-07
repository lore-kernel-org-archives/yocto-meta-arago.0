Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id A6BE852B6E
	for <meta-arago@arago-project.org>;
	Mon,  7 Jun 2021 10:38:49 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199]) by
	mx-outbound22-169.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 07 Jun 2021 10:39:29 +0000
Received: by mail-pg1-f199.google.com with SMTP id
	q64-20020a6343430000b02902164088f2f0so9975619pga.5
	for <meta-arago@arago-project.org>;
	Mon, 07 Jun 2021 03:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xZRXVSElO8Nzqb+EWuAm8Sv1GOqgxAwEt91tK02V2wc=;
	b=hO1ukvAfGgQHKylODJCxEgUDk9ZJgB2jSlAC5LRUt7kBBwdxRICoKvrWE/rc4Ls2Ng
	3SEMg/KKyvvuqzbaEs5KU/B2a+bChaBIhUEaXvd9Ss5BHKRjrDU3ddTZcG3Vm6QwEySy
	GZbfSyB9F5VU9zL1Arml0DIOuLGOBcFtT+Dms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xZRXVSElO8Nzqb+EWuAm8Sv1GOqgxAwEt91tK02V2wc=;
	b=nqmmW29uTKF6kThwIk3QeZK8iHt+JUxykCP0f/1JiHC2jMfm4x+X+IVWaP4lxtW6BP
	ZwmZZ8MoN0eGen2E62RiMLTB3p6XXVFBstmuPtGoJpjtRuk/RoZOgoSPNpGDaSN0UEzw
	P4cqeZx8rjfBtLIiczdtNay1pEz5lUvfnE6xtTWpEfGtt/Tr2rjFK93K28KMMOzt1KMD
	8oB1G5/cArYGPxmEhj+Cmocc7lMAywmVgIbSWDb/YcoqFu4OETVklTgRGJwsvBEZ8ErW
	OKnpxox3HGg1jP0O0iW797+PeCiNiN2eax55s8Ta2CJjIAmgxTOKzGT+/sp3XnOtzvvQ
	9jyw==
X-Gm-Message-State: AOAM5339a08X0qWpGJxjn8MgExVseHDP1cU+y89cmFBWjwrspDJva9me
	whbJ62n76zFVm97r4r71OC8hu7gM8KCT64xFdOtv3oz1p5+Efjy/iU36SgTFr3OCgShp0BCqkyv
	MXgHHtSKroaTm74zGFcZKHw5seycrlGfnFlLddaM2/iaGEZt3AaexbSW4BQ6H
X-Received: by 2002:a17:90b:503:: with SMTP id
	r3mr20031337pjz.195.1623062368423; 
	Mon, 07 Jun 2021 03:39:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4yQ89AHcG+crxjFBF80Z6c/OKeaPvOcczEZz7oa1Ei+gPqGXcuE8Y2WMoqBv3X8llL9J8Rw==
X-Received: by 2002:a17:90b:503:: with SMTP id
	r3mr20031322pjz.195.1623062368182; 
	Mon, 07 Jun 2021 03:39:28 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id l8sm8508706pgq.49.2021.06.07.03.39.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jun 2021 03:39:27 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Jun 2021 16:05:38 +0530
Message-Id: <20210607103539.72720-3-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
References: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
X-BESS-ID: 1623062369-305801-5424-471-1
X-BESS-VER: 2019.1_20210603.1645
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.232773 [from 
	cloudscan18-146.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: M V Pratap Reddy <pratap@ti.com>, Sekhar Nori <nsekhar@ti.com>,
	Priya N S <priya.ns@ti.com>
Subject: [master PATCH 2/3] create-sdcard: Fix wrong rootfs tarball selection
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
X-List-Received-Date: Mon, 07 Jun 2021 10:38:50 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

From: Priya N S <priya.ns@ti.com>

* Validate user input of rootfs tarball selection.
* This will not allow the user to proceed with wrong rootfs
  tarball selection.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 264095a..8f99687 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -767,9 +767,19 @@ cat << EOM
 
 EOM
 		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
-		echo ""
-		read -p "Enter Number of rootfs Tarball: " TARNUMBER
-		echo " "
+		COUNT=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print $1'} | wc -l`
+		ENTERCORRECTLY="0"
+		while [ $ENTERCORRECTLY -ne 1 ]
+		do
+			read -p "Enter Number of rootfs Tarball: " TARNUMBER
+			echo " "
+			if [ -z "${TARNUMBER//[0-$COUNT]}" ] && [ -n "$TARNUMBER" ] ; then
+				ENTERCORRECTLY=1
+			else
+				echo "Invalid selection!"
+			fi
+			echo ""
+		done
 		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
-- 
2.19.1.windows.1


