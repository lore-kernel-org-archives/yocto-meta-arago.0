Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 483C452978
	for <meta-arago@arago-project.org>;
	Wed, 21 Jan 2015 05:09:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0L59f0n029198
	for <meta-arago@arago-project.org>; Tue, 20 Jan 2015 23:09:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0L59fDZ013486
	for <meta-arago@arago-project.org>; Tue, 20 Jan 2015 23:09:41 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 20 Jan 2015 23:09:40 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0L59dmc007070;
	Tue, 20 Jan 2015 23:09:40 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Jan 2015 10:39:36 +0530
Message-ID: <1421816977-26680-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC PATCH] Increasing the max_leb_count
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
X-List-Received-Date: Wed, 21 Jan 2015 05:09:42 -0000
Content-Type: text/plain

Background:

* GLSDK brings in a lot of multimedia and graphics
  enabling components as well as example applications.
* Customers are going to add more software layers on top 
  of this to enable more feature rich graphics and multimedia. 
* There are two configurations that are used internally:
   ** Release filesystem
   ** Debug filesystem - (Release + GDB + dbg-pkgs)
      dbg-pkgs is basically the EXTRA_MACHINE_FEATURES in 
      the local.conf that brings in the sources and debug
      symbols to allow gdb debugging.

With the current leb_count it is not possible to support 
the above usecases. And to allow for enough room for the 
customer to add their components and not hit the space 
issue, it is proposed to make this change.

Karthik Ramanan (1):
  dra7xx-evm: ubifs: Increase "max_leb_cnt"

 conf/machine/dra7xx-evm.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


