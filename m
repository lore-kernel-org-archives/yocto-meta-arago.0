Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1CAB152ABB
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 12:50:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u43CoXFL006194
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 07:50:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43CoXsk014832
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 07:50:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 May 2016 07:50:32 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43CoXmJ012852	for
	<meta-arago@arago-project.org>; Tue, 3 May 2016 07:50:33 -0500
Message-ID: <57289E99.5000905@ti.com>
Date: Tue, 3 May 2016 08:50:33 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: systemd
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
X-List-Received-Date: Tue, 03 May 2016 12:50:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

With systemd recently enabled, I a wondering how to resolve when a 
package supports both systemd and sysvinit, but does not provide service 
files for every initscript it provides.

I am looking into busybox. It only provides systemd service files for 
syslog, but provides initscripts for other services such as udhcpd. By 
enabling the systemd distro feature and removing the sysvinit feature, 
all initscipts are removed from the installation, and thus services 
without systemd service files become unsupported.

Is there any way to resolve this without creating a udhcpd service file? 
Should sysvinit also be a DISTRO_FEATURE while the transistion to 
systemd is in progress?

Thank you,
Jake

