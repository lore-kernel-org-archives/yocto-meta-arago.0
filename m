Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 74E6052A3C
	for <meta-arago@arago-project.org>;
	Fri,  9 Sep 2016 13:31:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u89DVRfx015538
	for <meta-arago@arago-project.org>; Fri, 9 Sep 2016 08:31:27 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89DVPER011059
	for <meta-arago@arago-project.org>; Fri, 9 Sep 2016 08:31:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Sep 2016 08:31:25 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89DVPSm030953	for
	<meta-arago@arago-project.org>; Fri, 9 Sep 2016 08:31:25 -0500
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bf4e78a8-7aba-110c-53fe-4fad4c23b10f@ti.com>
Date: Fri, 9 Sep 2016 09:31:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Subject: k2 ramfs missing firmwre
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
X-List-Received-Date: Fri, 09 Sep 2016 13:31:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The K2 ramfs is missing the firmwares necessary to boot up. The K2 ramfs 
is simply the tisdk-server-rootfs-image in cpio.gz format.

These firmwares are available in the k2-initramfs image. However, when 
u-boot is configured for ramfs, the initramfs is not loaded prior to 
booting. Therefore it seems that the firmwares in the k2-initramfs 
should also be available in the tisdk-server-rootfs-image. Is this 
correct? Would this cause any conflict with other boot methods which do 
use the initramfs?

If these firmwares can go into the tisdk-server-rootfs-image, which 
would be the most appropriate pacakgegroup?


Thank you,

Jake


