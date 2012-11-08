Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 577C752A7B
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2012 06:44:17 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA86iGk2004895
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2012 00:44:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA86iGRV009214
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2012 00:44:16 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 8 Nov 2012 00:44:16 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA86iG1d007443;
	Thu, 8 Nov 2012 00:44:16 -0600
Date: Thu, 8 Nov 2012 01:44:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121108064415.GB14870@edge>
References: <8F29D6B095ED194EA1980491A5E029710C31AF50@DFLE09.ent.ti.com>
	<20121108044258.GA14870@edge>
	<8F29D6B095ED194EA1980491A5E029710C31B146@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C31B146@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: meta-toolchain-arago: move LD_LIBRARY_PATH setting into each shell stub [issue]
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
X-List-Received-Date: Thu, 08 Nov 2012 06:44:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Great! I can go get some sleep now... :)


On Thu, Nov 08, 2012 at 01:25:56AM -0500, Cooper Jr., Franklin wrote:
> Success! I just need to test building these applications via Qt Creator and Code Composer Studio but building from the command line works without a problem!
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, November 07, 2012 10:43 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] meta-toolchain-arago: move LD_LIBRARY_PATH setting into each shell stub [issue]
> 
> Ok, so the good news is that all the SDK binaries are working fine.
> 
> Now, as of the C++ headers, I'm surprised it used to work like that in previous SDKs, but I see that the headers are installed in the wrong place, not where toolchain expects them to find:
> 
> /linux-devkit/arm-arago-linux-gnueabi/usr/include/c++/4.5.3
> 
> And they should be:
> 
> /linux-devkit/arm-arago-linux-gnueabi/include/c++/4.5.3
> 
> Fixed now.
> 
> Denys
> 
> 
> On Thu, Nov 08, 2012 at 03:06:52AM +0000, Cooper Jr., Franklin wrote:
> > Some more progress being made. Building non Qt applications working 
> > again and qmake works. But make is having issues finding include files
> > 
> > /home/fcooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-evm-05.06.00.00/li
> > nux-devkit/arm-arago-linux-gnueabi/usr/include/qtopia/QtCore/qglobal.h:68:21: fatal error: algorithm: No such file or directory compilation terminated.
> > make: *** [main.o] Error 1
> > 
> > That header is apart of the C++ standard library and is located at 
> > /home/fcooper/sdk/alpha/11_07_8_10_PM/ti-sdk-am335x-evm-05.06.00.00/li
> > nux-devkit/arm-arago-linux-gnueabi/usr/include/c++/4.5.3
> > 
> > I am currently fiddling with mkspecs, linux.conf and QMAKE_INCDIR with no luck.
> > 
> > Complete log: pastebin.com/xRh4tWik
> > 
> > 
> > Regards,
> > Franklin Cooper Jr.
> > Texas Instruments
> > Application Engineer
> > fcooper@ti.com<mailto:fcooper@ti.com>
> > 
> 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

