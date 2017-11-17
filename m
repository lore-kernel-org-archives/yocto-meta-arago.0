Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9B9CC529D4
	for <meta-arago@arago-project.org>;
	Fri, 17 Nov 2017 23:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 641EF20B84;
	Fri, 17 Nov 2017 23:06:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gRGLGaOdPoZk; Fri, 17 Nov 2017 23:06:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D92420B6D;
	Fri, 17 Nov 2017 23:06:44 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A326C162728;
	Fri, 17 Nov 2017 18:06:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 17 Nov 2017 18:06:42 -0500
Message-Id: <1510960002-43443-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] systemd: add backport from v234 to help with rare missing serial device issue
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
X-List-Received-Date: Fri, 17 Nov 2017 23:06:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Issue discussed and patch identified by AGL:
https://jira.automotivelinux.org/browse/SPEC-544

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../systemd/backport-v234-e266c06-v230.patch       | 315 +++++++++++++++++++++
 .../recipes-core/systemd/systemd_%.bbappend        |   3 +-
 2 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/backport-v234-e266c06-v230.patch

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/backport-v234-e266c06-v230.patch b/meta-arago-distro/recipes-core/systemd/systemd/backport-v234-e266c06-v230.patch
new file mode 100644
index 0000000..013c128
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/backport-v234-e266c06-v230.patch
@@ -0,0 +1,315 @@
+commit e266c068b5597e18b2299f9c9d3ee6cf04198c41
+Author: Michal Sekletar <msekleta@redhat.com>
+Date:   Mon Jan 23 17:12:35 2017 +0100
+
+    service: serialize information about currently executing command
+    
+    Stored information will help us to resume execution after the
+    daemon-reload.
+    
+    This commit implements following scheme,
+    
+    * On serialization:
+      - we count rank of the currently executing command
+      - we store command type, its rank and command line arguments
+    
+    * On deserialization:
+      - configuration is parsed and loaded
+      - we deserialize stored data, command type, rank and arguments
+      - we look at the given rank in the list and if command there has same
+        arguments then we restore execution at that point
+      - otherwise we search respective command list and we look for command
+        that has the same arguments
+      - if both methods fail we do not do not resume execution at all
+    
+    To better illustrate how does above scheme works, please consider
+    following cases (<<< denotes position where we resume execution after reload)
+    
+    ; Original unit file
+    [Service]
+    ExecStart=/bin/true <<<
+    ExecStart=/bin/false
+    
+    ; Swapped commands
+    ; Second command is not going to be executed
+    [Service]
+    ExecStart=/bin/false
+    ExecStart=/bin/true <<<
+    
+    ; Commands added before
+    ; Same commands are problematic and execution could be restarted at wrong place
+    [Service]
+    ExecStart=/bin/foo
+    ExecStart=/bin/bar
+    ExecStart=/bin/true <<<
+    ExecStart=/bin/false
+    
+    ; Commands added after
+    ; Same commands are not an issue in this case
+    [Service]
+    ExecStart=/bin/true <<<
+    ExecStart=/bin/false
+    ExecStart=/bin/foo
+    ExecStart=/bin/bar
+    
+    ; New commands interleaved with old commands
+    ; Some new commands will be executed while others won't
+    ExecStart=/bin/foo
+    ExecStart=/bin/true <<<
+    ExecStart=/bin/bar
+    ExecStart=/bin/false
+    
+    As you can see, above scheme has some drawbacks. However, in most
+    cases (we assume that in most common case unit file command list is not
+    changed while some other command is running for the same unit) it
+    should cause that systemd does the right thing, which is restoring
+    execution exactly at the point we were before daemon-reload.
+    
+    Fixes #518
+
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+Upstream-Status: backport
+
+diff --git a/src/core/service.c b/src/core/service.c
+index 7ebabca5d..faa65efca 100644
+--- a/src/core/service.c
++++ b/src/core/service.c
+@@ -45,6 +45,7 @@
+ #include "service.h"
+ #include "signal-util.h"
+ #include "special.h"
++#include "stdio-util.h"
+ #include "string-table.h"
+ #include "string-util.h"
+ #include "strv.h"
+@@ -2059,6 +2060,80 @@ _pure_ static bool service_can_reload(Unit *u) {
+         return !!s->exec_command[SERVICE_EXEC_RELOAD];
+ }
+ 
++static unsigned service_exec_command_index(Unit *u, ServiceExecCommand id, ExecCommand *current) {
++        Service *s = SERVICE(u);
++        unsigned idx = 0;
++        ExecCommand *first, *c;
++
++        assert(s);
++
++        first = s->exec_command[id];
++
++        /* Figure out where we are in the list by walking back to the beginning */
++        for (c = current; c != first; c = c->command_prev)
++                idx++;
++
++        return idx;
++}
++
++static int service_serialize_exec_command(Unit *u, FILE *f, ExecCommand *command) {
++        Service *s = SERVICE(u);
++        ServiceExecCommand id;
++        unsigned idx;
++        const char *type;
++        char **arg;
++        _cleanup_strv_free_ char **escaped_args = NULL;
++        _cleanup_free_ char *args = NULL, *p = NULL;
++        size_t allocated = 0, length = 0;
++
++        assert(s);
++        assert(f);
++
++        if (!command)
++                return 0;
++
++        if (command == s->control_command) {
++                type = "control";
++                id = s->control_command_id;
++        } else {
++                type = "main";
++                id = SERVICE_EXEC_START;
++        }
++
++        idx = service_exec_command_index(u, id, command);
++
++        STRV_FOREACH(arg, command->argv) {
++                size_t n;
++                _cleanup_free_ char *e = NULL;
++
++                e = xescape(*arg, WHITESPACE);
++                if (!e)
++                        return -ENOMEM;
++
++                n = strlen(e);
++                if (!GREEDY_REALLOC(args, allocated, length + 1 + n + 1))
++                        return -ENOMEM;
++
++                if (length > 0)
++                        args[length++] = ' ';
++
++                memcpy(args + length, e, n);
++                length += n;
++        }
++
++        if (!GREEDY_REALLOC(args, allocated, length + 1))
++                return -ENOMEM;
++        args[length++] = 0;
++
++        p = xescape(command->path, WHITESPACE);
++        if (!p)
++                return -ENOMEM;
++
++        fprintf(f, "%s-command=%s %u %s %s\n", type, service_exec_command_to_string(id), idx, p, args);
++
++        return 0;
++}
++
+ static int service_serialize(Unit *u, FILE *f, FDSet *fds) {
+         Service *s = SERVICE(u);
+         ServiceFDStore *fs;
+@@ -2086,11 +2161,8 @@ static int service_serialize(Unit *u, FILE *f, FDSet *fds) {
+         if (r < 0)
+                 return r;
+ 
+-        /* FIXME: There's a minor uncleanliness here: if there are
+-         * multiple commands attached here, we will start from the
+-         * first one again */
+-        if (s->control_command_id >= 0)
+-                unit_serialize_item(u, f, "control-command", service_exec_command_to_string(s->control_command_id));
++        service_serialize_exec_command(u, f, s->control_command);
++        service_serialize_exec_command(u, f, s->main_command);
+ 
+         r = unit_serialize_item_fd(u, f, fds, "stdin-fd", s->stdin_fd);
+         if (r < 0)
+@@ -2137,6 +2209,106 @@ static int service_serialize(Unit *u, FILE *f, FDSet *fds) {
+         return 0;
+ }
+ 
++static int service_deserialize_exec_command(Unit *u, const char *key, const char *value) {
++        Service *s = SERVICE(u);
++        int r;
++        unsigned idx = 0, i;
++        bool control, found = false;
++        ServiceExecCommand id = _SERVICE_EXEC_COMMAND_INVALID;
++        ExecCommand *command = NULL;
++        _cleanup_free_ char *args = NULL, *path = NULL;
++        _cleanup_strv_free_ char **argv = NULL;
++
++        enum ExecCommandState {
++                STATE_EXEC_COMMAND_TYPE,
++                STATE_EXEC_COMMAND_INDEX,
++                STATE_EXEC_COMMAND_PATH,
++                STATE_EXEC_COMMAND_ARGS,
++                _STATE_EXEC_COMMAND_MAX,
++                _STATE_EXEC_COMMAND_INVALID = -1,
++        } state;
++
++        assert(s);
++        assert(key);
++        assert(value);
++
++        control = streq(key, "control-command");
++
++        state = STATE_EXEC_COMMAND_TYPE;
++
++        for (;;) {
++                _cleanup_free_ char *arg = NULL;
++
++                r = extract_first_word(&value, &arg, NULL, EXTRACT_CUNESCAPE);
++                if (r == 0)
++                        break;
++                else if (r < 0)
++                        return r;
++
++                switch (state) {
++                case STATE_EXEC_COMMAND_TYPE:
++                        id = service_exec_command_from_string(arg);
++                        if (id < 0)
++                                return -EINVAL;
++
++                        state = STATE_EXEC_COMMAND_INDEX;
++                        break;
++                case STATE_EXEC_COMMAND_INDEX:
++                        r = safe_atou(arg, &idx);
++                        if (r < 0)
++                                return -EINVAL;
++
++                        state = STATE_EXEC_COMMAND_PATH;
++                        break;
++                case STATE_EXEC_COMMAND_PATH:
++                        path = arg;
++                        arg = NULL;
++                        state = STATE_EXEC_COMMAND_ARGS;
++
++                        if (!path_is_absolute(path))
++                                return -EINVAL;
++                        break;
++                case STATE_EXEC_COMMAND_ARGS:
++                        r = strv_extend(&argv, arg);
++                        if (r < 0)
++                                return -ENOMEM;
++                        break;
++                default:
++                        assert_not_reached("Unknown error at deserialization of exec command");
++                        break;
++                }
++        }
++
++        if (state != STATE_EXEC_COMMAND_ARGS)
++                return -EINVAL;
++
++        /* Let's check whether exec command on given offset matches data that we just deserialized */
++        for (command = s->exec_command[id], i = 0; command; command = command->command_next, i++) {
++                if (i != idx)
++                        continue;
++
++                found = strv_equal(argv, command->argv) && streq(command->path, path);
++                break;
++        }
++
++        if (!found) {
++                /* Command at the index we serialized is different, let's look for command that exactly
++                 * matches but is on different index. If there is no such command we will not resume execution. */
++                for (command = s->exec_command[id]; command; command = command->command_next)
++                        if (strv_equal(command->argv, argv) && streq(command->path, path))
++                                break;
++        }
++
++        if (command && control)
++                s->control_command = command;
++        else if (command)
++                s->main_command = command;
++        else
++                log_unit_warning(u, "Current command vanished from the unit file, execution of the command list won't be resumed.");
++
++        return 0;
++}
++
+ static int service_deserialize_item(Unit *u, const char *key, const char *value, FDSet *fds) {
+         Service *s = SERVICE(u);
+         int r;
+@@ -2219,16 +2391,6 @@ static int service_deserialize_item(Unit *u, const char *key, const char *value,
+                         s->status_text = t;
+                 }
+ 
+-        } else if (streq(key, "control-command")) {
+-                ServiceExecCommand id;
+-
+-                id = service_exec_command_from_string(value);
+-                if (id < 0)
+-                        log_unit_debug(u, "Failed to parse exec-command value: %s", value);
+-                else {
+-                        s->control_command_id = id;
+-                        s->control_command = s->exec_command[id];
+-                }
+         } else if (streq(key, "socket-fd")) {
+                 int fd;
+ 
+@@ -2328,6 +2490,10 @@ static int service_deserialize_item(Unit *u, const char *key, const char *value,
+                         s->stderr_fd = fdset_remove(fds, fd);
+                         s->exec_context.stdio_as_fds = true;
+                 }
++        } else if (STR_IN_SET(key, "main-command", "control-command")) {
++                r = service_deserialize_exec_command(u, key, value);
++                if (r < 0)
++                        log_unit_debug_errno(u, r, "Failed to parse serialized command \"%s\": %m", value);
+         } else
+                 log_unit_debug(u, "Unknown serialization key: %s", key);
+ 
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 7f2ffb6..155d79e 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago4"
+PR_append = ".arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -17,6 +17,7 @@ SRC_URI_append = " \
     file://0001-libsystemd-network-ipv4ll-probe-conflict-counter.patch \
     file://0002-libsystemd-network-sd-ipv4ll-Wrapper-to-restart-addr.patch \
     file://0003-libsystemd-network-sd-ipv4ll-acquire-new-address-aft.patch \
+    file://backport-v234-e266c06-v230.patch \
 "
 
 do_install_append() {
-- 
2.7.4


