Return-Path: <meta-arago@emagii.com>
Received: from smtp-out21.han.skanova.net (smtp-out21.han.skanova.net
	[195.67.226.208])
	by arago-project.org (Postfix) with ESMTP id 8150B5298B
	for <meta-arago@arago-project.org>;
	Thu,  3 Jul 2014 11:43:24 +0000 (UTC)
Received: from [10.175.196.23] (213.66.90.56) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 53804BED00F91637 for meta-arago@arago-project.org;
	Thu, 3 Jul 2014 13:43:23 +0200
Message-ID: <53B541DB.9030105@emagii.com>
Date: Thu, 03 Jul 2014 13:43:23 +0200
From: Ulf Samuelsson <meta-arago@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <53B44965.5050502@emagii.com>	<53B449D5.30600@emagii.com>	<20140702181315.GA15788@edge>	<53B459CC.20805@emagii.com>	<20140702191802.GB15788@edge>	<53B45C0A.60805@emagii.com>	<8F29D6B095ED194EA1980491A5E029710C6DA912@DFLE08.ent.ti.com>	<53B46ADA.1070400@emagii.com>	<8F29D6B095ED194EA1980491A5E029710C6DAA36@DFLE08.ent.ti.com>
	<53B4F6EC.6070606@emagii.com>
In-Reply-To: <53B4F6EC.6070606@emagii.com>
Subject: BBB Problem: No USB host at boot
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
X-List-Received-Date: Thu, 03 Jul 2014 11:43:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Building for the Beaglebone Black, using 
meta-arago:dora/meta-ti:dora/linux-ti-staging_3.12

I boot with a mouse inserted in the USB host connector.   It is not 
detected.

$ lsusb gives an empty result

$ lsmod does not show anything but graphics

I need to start the USB host manually, for things to be working.

$ modprobe musb_am335x

Then the mouse is detected and lsusb gives the desired output

root@beaglebone:/# lsusb
Bus 002 Device 002: ID 413c:3016 Dell Computer Corp. Optical 5-Button 
Wheel Mouse
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub


BR
Ulf Samuelsson

