Return-Path: <jake@udc0866934>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4B42652092
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2018 19:47:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAGJldLE007472
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:47:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542397659;
	bh=WTle0q1eAftxGd0PZuhOeTjaCDErOT1w7PtlgcrqDlE=;
	h=From:To:CC:Subject:Date;
	b=ajkjPtkGOEmY8hqJxoZc3W3l3JDf6td/D4Ju0+m+fNO+AcwEvthdavM0nj40wvLJ+
	Xa/ORhwkwNwJeg7CNSZR7Wve3YUAiM7v/iZ95dQgAA+ccxTqQzE/Fz2SSGDM4P4cZk
	ZR+TRrTrI7pOFcWcUj96IoLiCejEX0yRp61ANqX4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAGJldKo126786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:47:39 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 16 Nov 2018 13:47:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 16 Nov 2018 13:47:38 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAGJlc8J031485;
	Fri, 16 Nov 2018 13:47:38 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1gNk5a-0005n3-9e; Fri, 16 Nov 2018 14:47:38 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Nov 2018 14:47:36 -0500
Message-ID: <1542397656-22225-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am65x: remove board option
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
X-List-Received-Date: Fri, 16 Nov 2018 19:47:49 -0000
Content-Type: text/plain

* Automatic board detection is functional, so remove this workaround.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am65x.sh | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
index 8d70880..beb7713 100644
--- a/setup-uboot-env-am65x.sh
+++ b/setup-uboot-env-am65x.sh
@@ -82,28 +82,6 @@ kernelimage="Image-""$platform"".bin"
 kernelimagesrc=`ls -1 $cwd/../board-support/prebuilt-images/$kernelimage`
 kernelimagedefault=`basename $kernelimagesrc`
 
-board_name=""
-while [ -z "$board_name" ]
-do
-    echo "Do you have the AM65x EVM or IDK?"
-    echo " 1: UNKOWN"
-    echo " 2: EVM"
-    echo " 3: IDK"
-    echo
-    read -p "[ 1 ] " board
-
-    if [ ! -n "$board" ]; then
-        board="1"
-    fi
-
-    case $board in
-        "1") board_name="am65x";;
-        "2") board_name="am65x_evm";;
-        "3") board_name="am65x_idk";;
-        *) echo "Invalid reponse. Please enter 1-3."; echo;;
-    esac
-done
-
 echo "Select Linux kernel location:"
 echo " 1: TFTP"
 echo " 2: SD card"
@@ -168,7 +146,6 @@ do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 # Configurable settings
 do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv nfs_root $rootpath\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv board_name $board_name\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
 
 # General macros
-- 
1.9.1


