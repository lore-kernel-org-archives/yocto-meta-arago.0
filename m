Return-Path: <meta-arago@emagii.com>
Received: from mxf3.bahnhof.se (mxf3.bahnhof.se [213.80.101.27])
	by arago-project.org (Postfix) with ESMTP id E529152093
	for <meta-arago@arago-project.org>;
	Sun,  8 Mar 2015 20:19:32 +0000 (UTC)
Received: from localhost (mxf3.local [127.0.0.1])
	by mxf3-reinject (Postfix) with ESMTP id 077735E4C73
	for <meta-arago@arago-project.org>;
	Sun,  8 Mar 2015 21:19:32 +0100 (CET)
X-Virus-Scanned: by amavisd-new using ClamAV at bahnhof.se (MXF1)
X-Spam-Score: 0.306
X-Spam-Level: 
X-Spam-Status: No, score=0.306 tagged_above=-99 required=5
	tests=[DNS_FROM_AHBL_RHSBL=0.306]
Received: from mxf3.bahnhof.se ([127.0.0.1])
	by localhost (mxf3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1CSOmir-jfe for <meta-arago@arago-project.org>;
	Sun,  8 Mar 2015 21:19:24 +0100 (CET)
Received: from smtp-auth2.bahnhof.se (smtp-auth.bahnhof.se [213.136.33.6])
	by mxf3.bahnhof.se (Postfix) with ESMTP id 207A95E4E9E
	for <meta-arago@arago-project.org>;
	Sun,  8 Mar 2015 21:19:23 +0100 (CET)
Received: from [10.175.196.199] (h-169-18.a454.priv.bahnhof.se [37.123.169.18])
	(Authenticated sender: mb782575)
	by smtp-auth2.bahnhof.se (Postfix) with ESMTPA id DCE7D2886B
	for <meta-arago@arago-project.org>;
	Sun,  8 Mar 2015 21:19:23 +0100 (CET)
Message-ID: <54FCAECB.7020005@emagii.com>
Date: Sun, 08 Mar 2015 21:19:23 +0100
From: Ulf Samuelsson <meta-arago@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
Subject: Example Device Tree files when building AM335x/OpenGL support
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
X-List-Received-Date: Sun, 08 Mar 2015 20:19:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Are there any examples of Device-Trees files which are compatible with 
the "omaplfb" driver for OpenGL

Running a Beaglebone derivative using AM3359.


Did this for the Beaglebone + LCD4 but when I do the same changes for 
another LCD the screen does not come up.
The fix enabled some clocks, and replaced the tilcdc compatible panel 
with an &lcdc entry.




BR
Ulf Samuelsson



