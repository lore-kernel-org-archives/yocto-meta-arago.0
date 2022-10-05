Return-Path: <evan.oloughlin@vitalograph.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB97C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 14:43:55 +0000 (UTC)
Subject: Ubuntu 22.04 support for morty-based TI SDK 04.03.00.05
To: meta-arago@lists.yoctoproject.org
From: "vitalEol" <evan.oloughlin@vitalograph.ie>
X-Originating-Location: Cork, Munster, IE (87.120.241.2)
X-Originating-Platform: Linux Firefox 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 05 Oct 2022 07:43:51 -0700
Message-ID: <jh6X.1664981031366751590.HuZG@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Oct 2022 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14051

Hi all,

Just wondering if anyone has had success building morty-based systems on Ub=
untu 22.04?

As part of my environment setup scripts I've added the following to force u=
se of python3.8 (3.8.14) as python3.10 is the default in 22.04
* alias python3=3D/usr/bin/python3.8
* export PYTHONPATH=3D/usr/lib/python3.8:$PYTHONPATH

This seems to work in that I get passed the initial error relating to use o=
f MutableMapping from collections (due to being deprecated)

The next error I hit relates to fork_exec():
***************************************************************************=
**************************
[proj-devkit]:build> bitbake $MACHINE-image
Traceback (most recent call last):
  File "/buildData/Proj_OS/sources/bitbake/bin/bitbake", line 47, in <modul=
e>
    sys.exit(bitbake_main(BitBakeConfigParameters(sys.argv),
  File "/buildData/Proj_OS/sources/bitbake/lib/bb/main.py", line 468, in bi=
tbake_main
    server =3D start_server(servermodule, configParams, configuration, feat=
ureset)
  File "/buildData/Proj_OS/sources/bitbake/lib/bb/main.py", line 354, in st=
art_server
    cooker =3D bb.cooker.BBCooker(configuration, features)
  File "/buildData/Proj_OS/sources/bitbake/lib/bb/cooker.py", line 178, in =
__init__
    self.configwatcher =3D pyinotify.WatchManager()
  File "/buildData/Proj_OS/sources/bitbake/lib/pyinotify.py", line 1757, in=
 __init__
    self._inotify_wrapper =3D INotifyWrapper.create()
  File "/buildData/Proj_OS/sources/bitbake/lib/pyinotify.py", line 126, in =
create
    if inotify.init():
  File "/buildData/Proj_OS/sources/bitbake/lib/pyinotify.py", line 210, in =
init
    libc_name =3D ctypes.util.find_library(try_libc_name)
  File "/usr/lib/python3.8/ctypes/util.py", line 340, in find_library
    return _findSoname_ldconfig(name) or \
  File "/usr/lib/python3.8/ctypes/util.py", line 300, in _findSoname_ldconf=
ig
    with subprocess.Popen(['/sbin/ldconfig', '-p'],
  File "/usr/lib/python3.8/subprocess.py", line 858, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib/python3.8/subprocess.py", line 1639, in _execute_child
    self.pid =3D _posixsubprocess.fork_exec(
TypeError: fork_exec() takes exactly 21 arguments (17 given)
***************************************************************************=
**************************

I didn't have these problems with my previous dev machine using Ubuntu 20.0=
4 which uses python3.8.10

It seems I'm stuck with Ubuntu 22.04 so have to work through the issues

Regards,
Evan

