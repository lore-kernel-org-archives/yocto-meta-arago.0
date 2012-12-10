Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9090852987
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2012 20:40:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qBAKe8CM003527
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2012 14:40:08 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qBAKe8FF006518
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2012 14:40:08 -0600
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 10 Dec 2012 14:40:08 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qBAKe88s007637	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2012 14:40:08 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qBAKe8w29923	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2012 14:40:08 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id A31AE110604A	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2012 15:40:07 -0500 (EST)
Message-ID: <50C648A7.4050601@ti.com>
Date: Mon, 10 Dec 2012 15:40:07 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: meta-arago master 469a8425 seems broken
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
X-List-Received-Date: Mon, 10 Dec 2012 20:40:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

jenkins@jenkins1:/home/a0850405/oe/build$ MACHINE=am335x-evm bitbake
virtual/bootloader -c clean
Parsing recipes: 100%
|####################################################################################|
Time: 00:00:15
Parsing of 1353 .bb files complete (0 cached, 1353 parsed). 1719
targets, 131 skipped, 8 masked, 0 errors.
ERROR: No recipes available for:
 
/home/a0850405/oe/sources/meta-arago/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
ERROR: Command execution failed: Exited with 1

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


jenkins@jenkins1:/home/a0850405/oe/sources/meta-arago$ git log
commit 469a8425e702969a5be18dae0184980bd4d031b4
Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Dec 6 10:44:26 2012 -0500

    arago.conf: bump the version
    
    Signed-off-by: Denys Dmytriyenko <denys@ti.com>



