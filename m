Return-Path: <jose.alarcon@kuviovision.com>
Received: from webmail1.louhi.net (webmail.louhi.net [77.240.18.35])
	by arago-project.org (Postfix) with ESMTP id EC57152998
	for <meta-arago@arago-project.org>;
	Wed, 15 Jan 2014 17:34:12 +0000 (UTC)
Received: by webmail1.louhi.net (Postfix, from userid 33)
	id A3AE61C0005; Wed, 15 Jan 2014 19:34:11 +0200 (EET)
To: <meta-arago@arago-project.org>
MIME-Version: 1.0
Date: Wed, 15 Jan 2014 19:34:11 +0200
From: jose.alarcon@kuviovision.com
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9E@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9E@USNYGRMBX4.raymondcorp.local>
Message-ID: <62b1a363ad07cbdd9cafc25323c67767@kuviovision.com>
X-Sender: jose.alarcon@kuviovision.com
User-Agent: Louhi Webmail/0.8.4
Subject: Old version of ti-ipc package in MCSDK 3.03
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
X-List-Received-Date: Wed, 15 Jan 2014 17:34:13 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Last September we found a bug on ti-ipc MessageQ implementation that 
caused some messages getting lost [1].This bug was fixed on the ipcdev 
git repo a while ago [2]. However, this fix hasn't made it yet to any 
MCSDK release. The current version of ti-ipc on MCSDK 3.0.3 is 
3.00.04.29. This is also the version which seems to be used in the 
upcoming 3.1 release...

We have cherry picked that fix and it seems to work OK. However, we are 
still experiencing some issues with the IPC communication (some messages 
from the DSP to the ARM core get corrupted). Before spending time 
debugging this, we would like to try upgrading the ti-ipc package, since 
there seem to be quite man other bug fixes and changes since version 
3.00.04.29. We tried building it from the top of the master branch using 
bitbake but it fails to configure. Is there any newer version of this 
package that is know to work OK on MCSDK environment?

(I posted this question to TI E2E community. I am asking here too in 
case someone can help out. Apologies for the double posting)

--
Jose Alarcon

[1] 
http://e2e.ti.com/support/embedded/linux/f/354/p/288708/1008659.aspx

[2] 
http://git.ti.com/cgit/cgit.cgi/ipc/ipcdev.git/commit/?id=7610394a7901b753ea4f2ba938ce96a42964420b

