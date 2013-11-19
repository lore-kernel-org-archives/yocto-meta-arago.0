Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3FEF15299E
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 18:02:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJI2VH2017340;
	Tue, 19 Nov 2013 12:02:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJI2V2r031263;
	Tue, 19 Nov 2013 12:02:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 12:02:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJI2Vte005761;
	Tue, 19 Nov 2013 12:02:31 -0600
Date: Tue, 19 Nov 2013 13:02:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Dilip Kumar <008dilip@gmail.com>
Message-ID: <20131119180230.GD27758@edge>
References: <CABmxB3MGD26wRTWVw_tzfX1tHng8BXLYgvpujgrXcvQOsexRRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABmxB3MGD26wRTWVw_tzfX1tHng8BXLYgvpujgrXcvQOsexRRA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Ltp-ddt into Yocto project
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
X-List-Received-Date: Tue, 19 Nov 2013 18:02:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 19, 2013 at 11:28:42PM +0530, Dilip Kumar wrote:
> Hi all,
> 
> This is my first mail to the arago mailing list.
> 
> I need to whether it is possible to add ltp-ddt to into the existing
> default Yocto project build, I.e in poky dylan distribution and to run in
> qemulator. If is it possible, May I know how we can add the test tool ltp-
> ddt and procedure for adding like which recipe to add or which layer to be
> added.
> I am waiting for your response.

First of all, ltp-ddt is already in meta-openembedded, but unfortunately it's 
quite old there. Since it is actively being developed, we keep an AUTOREV-ed 
recipe in meta-arago. So, you can either update the recipe in meta-oe with the 
recent SRCREV, or just add meta-arago-extras layer into your poky build. It 
should not conflict with Poky distro, as Arago distro specifics are in own 
meta-arago-distro layer.

Second, ltp-ddt is very machine specific as it exercises machine-specifici 
peripherals, so I doubt it will run under qemu...

-- 
Denys

